# shellcheck shell=bash
######################################################################
#<
#
# Function: p6df::modules::cloudsmith::deps()
#
#>
######################################################################
p6df::modules::cloudsmith::deps() {
  ModuleDeps=(
    p6m7g8-dotfiles/p6common
  )
}

######################################################################
#<
#
# Function: p6df::modules::cloudsmith::external::brews()
#
#>
######################################################################
p6df::modules::cloudsmith::external::brews() {

  brew tap cloudsmith-io/cloudsmith-cli
  brew install cloudsmith-cli

  p6_return_void
}

######################################################################
#<
#
# Function: str str = p6df::modules::cloudsmith::prompt::mod()
#
#  Returns:
#	str - str
#
#  Environment:	 CLOUDSMITH_API_KEY P6_DFZ_PROFILE_CLOUDSMITH
#>
######################################################################
p6df::modules::cloudsmith::prompt::mod() {

  local str
  if ! p6_string_blank "$P6_DFZ_PROFILE_CLOUDSMITH"; then
    str="cloudsmith:\t  $P6_DFZ_PROFILE_CLOUDSMITH:"
    if ! p6_string_blank "$CLOUDSMITH_API_KEY"; then
      str=$(p6_string_append "$str" "api" " ")
    fi
    if ! p6_string_blank "$NPM_AUTH_TOKEN"; then
      str=$(p6_string_append "$str" "cs:npm" " ")
    fi
    if ! p6_string_blank "$BUNDLE_DL__CLOUDSMITH__IO"; then
      str=$(p6_string_append "$str" "cs:rg" " ")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::cloudsmith::profile::on(profile, [api_key=])
#
#  Args:
#	profile -
#	OPTIONAL api_key - []
#
#  Environment:	 CLOUDSMITH_API_KEY P6_DFZ_PROFILE_CLOUDSMITH
#>
######################################################################
p6df::modules::cloudsmith::profile::on() {
  local profile="$1"
  local api_key="$2"
  local entitlement_key="$3"

  p6_env_export "P6_DFZ_PROFILE_CLOUDSMITH" "$profile"
  p6_env_export "CLOUDSMITH_API_KEY" "$api_key"

  p6_env_export "NPM_AUTH_TOKEN" "$entitlement_key" # XXX: NOT NPM_TOKEN
  p6_env_export "BUNDLE_DL__CLOUDSMITH__IO" "token:$entitlement_key"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::cloudsmith::profile::off()
#
#  Environment:	 CLOUDSMITH_API_KEY P6_DFZ_PROFILE_CLOUDSMITH
#>
######################################################################
p6df::modules::cloudsmith::profile::off() {

  p6_env_export_un P6_DFZ_PROFILE_CLOUDSMITH
  p6_env_export_un CLOUDSMITH_API_KEY
  p6_env_export_un NPM_AUTH_TOKEN
  p6_env_export_un BUNDLE_DL__CLOUDSMITH__IO

  p6_return_void
}

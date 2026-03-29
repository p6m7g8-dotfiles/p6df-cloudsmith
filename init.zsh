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

  p6df::core::homebrew::cmd::brew tap cloudsmith-io/cloudsmith-cli
  p6df::core::homebrew::cmd::brew install cloudsmith-cli

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
#  Environment:	 BUNDLE_DL__CLOUDSMITH__IO CLOUDSMITH_API_KEY NPM_AUTH_TOKEN P6_DFZ_PROFILE_CLOUDSMITH
#>
######################################################################
p6df::modules::cloudsmith::prompt::mod() {

  local str
  if p6_string_blank_NOT "$P6_DFZ_PROFILE_CLOUDSMITH"; then
    str="cloudsmith:\t  $P6_DFZ_PROFILE_CLOUDSMITH:"
    if p6_string_blank_NOT "$CLOUDSMITH_API_KEY"; then
      str=$(p6_string_append "$str" "api" " ")
    fi
    if p6_string_blank_NOT "$NPM_AUTH_TOKEN"; then
      str=$(p6_string_append "$str" "cs:npm" " ")
    fi
    if p6_string_blank_NOT "$BUNDLE_DL__CLOUDSMITH__IO"; then
      str=$(p6_string_append "$str" "cs:rg" " ")
    fi
  fi

  p6_return_str "$str"
}

######################################################################
#<
#
# Function: p6df::modules::cloudsmith::profile::on(profile, code)
#
#  Args:
#	profile -
#	code - shell code block (export CLOUDSMITH_API_KEY=... CLOUDSMITH_ENTITLEMENT_TOKEN=...)
#
#  Environment:	 BUNDLE_DL__CLOUDSMITH__IO CLOUDSMITH_API_KEY CLOUDSMITH_ENTITLEMENT_TOKEN NPM_AUTH_TOKEN P6_DFZ_PROFILE_CLOUDSMITH
#>
######################################################################
p6df::modules::cloudsmith::profile::on() {
  local profile="$1"
  local code="$2"

  p6_run_code "$code"

  p6_env_export "P6_DFZ_PROFILE_CLOUDSMITH" "$profile"

  p6_return_void
}

######################################################################
#<
#
# Function: p6df::modules::cloudsmith::profile::off(code)
#
#  Args:
#	code - shell code block previously passed to profile::on
#
#  Environment:	 BUNDLE_DL__CLOUDSMITH__IO CLOUDSMITH_API_KEY CLOUDSMITH_ENTITLEMENT_TOKEN NPM_AUTH_TOKEN P6_DFZ_PROFILE_CLOUDSMITH
#>
######################################################################
p6df::modules::cloudsmith::profile::off() {
  local code="$1"

  p6_env_unset_from_code "$code"
  p6_env_export_un P6_DFZ_PROFILE_CLOUDSMITH

  p6_return_void
}

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
# Function: words cloudsmith = p6df::modules::cloudsmith::profile::mod()
#
#  Returns:
#	words - cloudsmith
#
#  Environment:	 CLOUDSMITH_API_KEY
#>
######################################################################
p6df::modules::cloudsmith::profile::mod() {

  p6_return_words 'cloudsmith' '$CLOUDSMITH_API_KEY'
}

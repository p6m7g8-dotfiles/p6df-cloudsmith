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
#>
######################################################################
p6df::modules::cloudsmith::prompt::mod() {

  local str="cloudsmith:        pgollucci"

  p6_return_str "$str"
}

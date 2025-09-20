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
# Function: str str = p6df::modules::cloudsmith::prompt::line()
#
#  Returns:
#	str - str
#
#  Environment:	 PD_API_KEY
#>
######################################################################
p6df::modules::cloudsmith::prompt::line() {

  local str="cloudsmith:        pgollucci"

  p6_return_str "$str"
}

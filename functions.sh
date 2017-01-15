#!/bin/bash
#
# Bash functions
#
# Loaded after environment.sh and aliases.sh
#

# Writes a crontab file to stdout
pgem_cron_out()
{
  local load="$_PGEM_LOC/load.sh"
  # TODO this still defines a global function; rename or remove
  cronFile()
  {
    local file="jobs.txt"
    if [[ -f "$file" ]]
    then
      echo "-f $(_realpath "$file")"
    fi
  }
  local files
  files=$(_eachGem cronFile)
  # TODO resolve this shellcheck warning
  # shellcheck disable=SC2086
  "$_PGEM_LOC/cron.gem/cronBuild.py" -p "$load" $files "$@" "${CRON_GEM_JOBS[@]}"
}

# Prints information about the available jobs
pgem_cron_info()
{
  pgem_cron_out -i
}

# Overwrites the user crontab with the ProfileGem crontab
pgem_cron_user()
{
  pgem_cron_out | crontab && echo "Successfully installed user crontab"
}

# Writes the ProfileGem crontab to /etc/cron.d
pgem_cron_etc()
{
  if [[ -z "$1" ]]
  then
    local path="/etc/cron.d/profileGem"
  else
    local path="$1"
  fi
  pgem_cron_out -u - > "$path" && echo "Successfully installed system crontab to $path"
}


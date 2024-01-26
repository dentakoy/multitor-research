
#!/usr/bin/env bash

readonly _dir="$(dirname "$(readlink -f "$0")")"

# shellcheck disable=SC2034
_arg="$1"

if [[ "$1" == "install" ]] ; then

  sudo printf "%s\\n" "Create symbolic link to /usr/local/bin"

  if [[ -e "${_dir}/bin/multitor" ]] ; then

    if [[ ! -e "/usr/local/bin/multitor" ]] ; then

      sudo ln -s "${_dir}/bin/multitor" /usr/local/bin

    fi

  fi

  sudo printf "%s\\n" "Create man page to /usr/local/man/man8"

  if [[ -e "${_dir}/static/man8/multitor.8" ]] ; then

    if [[ ! -e "/usr/local/man/man8/multitor.8.gz" ]] ; then

      sudo mkdir -p /usr/local/man/man8
      sudo cp "${_dir}/static/man8/multitor.8" /usr/local/man/man8
      sudo gzip /usr/local/man/man8/multitor.8

    fi

  fi

elif [[ "$1" == "uninstall" ]] ; then

  sudo printf "%s\\n" "Remove symbolic link from /usr/local/bin"

  if [[ -L "/usr/local/bin/multitor" ]] ; then

    sudo unlink /usr/local/bin/multitor

  fi

  sudo printf "%s\\n" "Remove man page from /usr/local/man/man8"

  if [[ -e "/usr/local/man/man8/multitor.8.gz" ]] ; then

    sudo rm /usr/local/man/man8/multitor.8.gz

  fi

else

  printf "Usage:\\n  ./setup.sh install     (Install)\\n  ./setup.sh uninstall   (Uninstall)\\n"

fi

exit 0


# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
CURRENT_SCRIPT=$BASH_SOURCE

if [[ -n $CURRENT_SCRIPT && -x readlink ]]; then
  SCRIPT_PATH=$(readlink -n $CURRENT_SCRIPT)
  DOTFILES_DIR="${PWD}/$(dirname $(dirname $SCRIPT_PATH))"
elif [ -d "~/cloudfiles/code/Users/nsp005/.dotfiles" ]; then
  DOTFILES_DIR="~/cloudfiles/code/Users/nsp005/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return
fi

# Source the dotfiles (order matters)
for DOTFILE in ~/cloudfiles/code/Users/nsp005/.dotfiles/system/.{env,alias,autocomplete}; do
  . "$DOTFILE"
done

unset CURRENT_SCRIPT SCRIPT_PATH DOTFILE

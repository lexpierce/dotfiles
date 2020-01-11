#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/dotfiles/old             # old dotfiles backup directory
files="$(ls ~/dotfiles | grep -v makesymlinks | grep -vw old)"

##########

# create dotfiles_old in ~ if needed...
[[ -d $olddir ]] || {
  echo -n "Creating $olddir for backup of any existing dotfiles in ~"
  mkdir -p $olddir
}

git clone https://github.com/chriskempson/base16-shell.git ${HOME}/.config/base16-shell


cd $dir || exit

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks from the homedir to any files in the ~/dotfiles directory specified in $files
echo "Moving any existing dotfiles from ~ to $olddir and creating symlinks."
for file in $files; do
  [[ -h ~/.$file ]] || {
    [[ -f ~/.$file || -d ~/.$file ]] && {
      echo "Moving .$file to ${olddir}."
      mv ~/".$file" "$olddir"/"$file"
    }
    echo "Creating symlink to $file in home directory."
    ln -s "$dir"/"$file" ~/".$file"
  }
done

# Install zimfw if not yet done
[[ -f ~/.zim/zimfw.zsh ]] || {
  mkdir ~/.zim
  curl -L -o ~/.zim/zimfw.zsh https://raw.githubusercontent.com/zimfw/zimfw/master/zimfw.zsh
  cd ~/.zim
  echo "run source ~/.zim/zimfw.zsh install"
}

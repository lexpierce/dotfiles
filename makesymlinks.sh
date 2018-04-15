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

# Clone zimfw
git clone --recursive https://github.com/zimfw/zimfw.git ${ZDOTDIR:-${HOME}}/.zim

cd $dir

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


#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ${HOME}/dotfiles
############################

########## Variables

dotfiles=${HOME}/dotfiles               # dotfiles directory
olddir=${HOME}/dotfiles/old             # old dotfiles backup directory
files="$(ls ${HOME}/dotfiles | grep -v makesymlinks | grep -vw old | grep -v xdg)"
xdg_config="kitty git"

##########

# create dotfiles_old in ${HOME} if needed...
[[ -d ${olddir} ]] || {
  echo -n "Creating ${olddir} for backup of any existing dotfiles in ${HOME}"
  mkdir -p ${olddir}
}

[[ -d ${HOME}/.config/base16-shell ]] &&
  git clone https://github.com/chriskempson/base16-shell.git \
   ${HOME}/.config/base16-shell

cd ${dotfiles} || exit

# move any existing dotfiles in homedir to dotfiles_old directory, then create
#symlinks from the homedir to any files in the ${HOME}/dotfiles directory specified in ${file}s
echo "Moving any existing dotfiles from ${HOME}/ to ${olddir} and creating symlinks."
for file in ${file}s; do
  [[ -h ${HOME}/.${file} ]] || {
    [[ -f ${HOME}/.${file} || -d ${HOME}/.${file} ]] && {
      echo "Moving .${file} to ${olddir}."
      mv ${HOME}/".${file}" "${olddir}"/"${file}"
    }
    echo "Creating symlink to ${dotfiles}/${file} in home directory."
    ln -s "$dir"/"${file}" ${HOME}/".${file}"
  }
done
echo "Moving any existing files or directories from ${XDG_CONFIG_HOME:-"${HOME}/.config"} to ${olddir} and creating symlinks."
for dir in ${xdg_config}; do
  [[ -h ${XDG_CONFIG_HOME:-${HOME}/.config}/${dir} ]] ||
    [[ -f ${XDG_CONFIG_HOME:-${HOME}/.config}/${dir} || -d ${XDG_CONFIG_HOME:-${HOME}/.config}/${dir} ]] && {
      echo "Moving ${XDG_CONFIG_HOME:-${HOME}/.config}/${dir} to ${olddir}."
      mv ${XDG_CONFIG_HOME:-${HOME}/.config}/${dir} ${olddir}/${dir}
  }
  echo "Creating symlink to ${dotfiles}/xdg/${dir} in ${XDG_CONFIG_HOME:-${HOME}/.config}"
  ln -s "${dotfiles}/xdg/${dir}" ${XDG_CONFIG_HOME:-${HOME}/.config}/${dir}
done

# Install zimfw if not yet done
[[ -f ${HOME}/.zim/zimfw.zsh ]] || {
  mkdir ${HOME}/.zim
  curl -L -o ${HOME}/.zim/zimfw.zsh https://raw.githubusercontent.com/zimfw/zimfw/master/zimfw.zsh
  cd ${HOME}/.zim
  echo "run source ${HOME}/.zim/zimfw.zsh install"
}

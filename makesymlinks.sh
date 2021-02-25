#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles
# in ${HOME}/dotfiles
############################

########## Variables

dotfiles="${HOME}/dotfiles"								# dotfiles directory
olddir="${HOME}/dotfiles/old"							# old dotfiles backup directory
files="bash_profile bash_prompt.bash bashrc dircolors p10k.zsh tmux tmux.conf vim vimrc zimrc zlogin zshenv zshrc"
xdg_config="alacritty git kitty starship.toml"

##########

# create ${olddir} if needed...
[[ -d "${olddir}" ]] || {
	echo -n "Creating ${olddir} for backup of any existing dotfiles in ${HOME}"
	mkdir -p "${olddir}"
}

# Setup shell colors
[[ -d "${HOME}/.config/base16-shell" ]] ||
	git clone https://github.com/chriskempson/base16-shell.git "${HOME}/.config/base16-shell"

cd "${dotfiles}" || exit

# move any existing dotfiles in homedir to ${olddir}, then create symlinks
# from the homedir to any files/directories in ${HOME}/dotfiles specified
# in ${files}
echo "Moving any existing dotfiles from ${HOME} to ${olddir} and creating symlinks."
for file in ${files}; do
	[[ -h ${HOME}/.${file} ]] || {
		[[ -f ${HOME}/.${file} || -d ${HOME}/.${file} ]] && {
			echo "Moving .${file} to ${olddir}."
			mv -v "${HOME}/.${file}" "${olddir}/${file}"
		}
	echo "Creating symlink to ${dotfiles}/${file} in home directory."
	ln -sv "${dotfiles}/${file}" "${HOME}/.${file}"
	}
done
echo "Moving any existing files or directories from ${XDG_CONFIG_HOME:-"${HOME}/.config"} to ${olddir} and creating symlinks."
for dir in ${xdg_config}; do
	[[ -h ${XDG_CONFIG_HOME:-${HOME}/.config}/${dir} ]] || {
		[[ -f ${XDG_CONFIG_HOME:-${HOME}/.config}/${dir} || -d ${XDG_CONFIG_HOME:-${HOME}/.config}/${dir} ]] && {
			echo "	-> Moving ${XDG_CONFIG_HOME:-${HOME}/.config}/${dir} to ${olddir}."
			mv "${XDG_CONFIG_HOME:-${HOME}/.config}/${dir}" "${olddir}/${dir}"
		}
	echo "	-> Creating symlink to ${dotfiles}/xdg/${dir} in ${XDG_CONFIG_HOME:-${HOME}/.config}"
	ln -s "${dotfiles}/xdg/${dir}" "${XDG_CONFIG_HOME:-${HOME}/.config}/${dir}"
}
done

# Install zimfw if not yet done
[[ -f ${HOME}/.zim/zimfw.zsh ]] || {
	mkdir -v "${HOME}/.zim"
	curl -L -o "${HOME}/.zim/zimfw.zsh" "https://raw.githubusercontent.com/zimfw/zimfw/master/zimfw.zsh"
	printf "\nRun 'source %s/.zim/zimfw.zsh install" "${HOME}"
}

# Prompt to install Starship if not available
command -v starship &> /dev/null ||
	printf "\nRun 'curl -fsSL https://starship.rs/install.sh | bash' to install starship"

if status is-interactive
	# Commands to run in interactive sessions can go here
	fish_vi_key_bindings
	if command -sq zoxide
		zoxide init --hook pwd fish | source
	else
		echo 'zoxide: command not found, please install it from https://github.com/ajeetdsouza/zoxide'
	end
	# FZF color & sane defaults from PatrickF1/fzf.fish
	set -xg FZF_DEFAULT_OPTS "--cycle --layout=reverse --border --height=90% --preview-window=wrap --marker='*' \
	--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
	--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
	--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796"

	# iTerm2 shell integration
	test -e ~/.iterm2_shell_integration.fish ; and source ~/.iterm2_shell_integration.fish ; or true
end


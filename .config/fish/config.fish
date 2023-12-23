if status is-interactive
	# Commands to run in interactive sessions can go here
	fish_vi_key_bindings
	if command -sq zoxide
		zoxide init --hook pwd fish | source
	else
		echo 'zoxide: command not found, please install it from https://github.com/ajeetdsouza/zoxide'
	end
end

if status is-interactive
    # Commands to run in interactive sessions can go here

	fish_vi_key_bindings
	zoxide init --hook pwd fish | source
end

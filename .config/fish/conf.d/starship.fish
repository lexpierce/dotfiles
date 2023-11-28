if not status is-interactive && test "$CI" != true
    exit
end
if command -sq starship
	starship init fish | source
else
	echo 'starship: command not found, please install it from https://starship.rs'
end

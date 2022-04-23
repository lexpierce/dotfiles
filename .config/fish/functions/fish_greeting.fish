function fish_greeting
	command -vq ponysay && ponysay -b round "Welcome to $(hostname -s)!"
end

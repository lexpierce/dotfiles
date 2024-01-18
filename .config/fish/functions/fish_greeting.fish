function fish_greeting
	command -vq ponysay && ponysay -b round "$(cat /etc/motd)"
end

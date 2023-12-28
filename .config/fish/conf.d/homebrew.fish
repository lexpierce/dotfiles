if command -sq /opt/homebrew/bin/brew
	eval (/opt/homebrew/bin/brew shellenv fish)
end

# Homebrew version overrides

set -xpg PATH /opt/homebrew/opt/openjdk@17/bin
set -xpg PATH /opt/homebrew/opt/node@18/bin
set -xpg PATH /opt/homebrew/opt/python@3.12/libexec/bin

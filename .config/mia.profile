export EDITOR=nvim

export MANPATH=/usr/local/share/man:$MANPATH

export PATH=$HOME/$(hostname)/mira:$PATH

if [ -d ~/.local/share/flatpak/exports/bin ]
then
	export PATH=~/.local/share/flatpak/exports/bin:$PATH
fi

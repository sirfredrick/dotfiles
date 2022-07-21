export PATH=$HOME/bin/vid:$HOME/bin/$(hostname):$HOME/bin:/sbin:$PATH

# export PS1=" \u@\H:\W\$ "

export PS1='$(prompt) \$ '

export ENV=$HOME/.env

export EDITOR=vim
export LANG=en_US.UTF-8
export HISTSIZE=65536

export GOPATH=$HOME/.local/share/go
export GOPROXY=direct
export GOSUMDB=off
export DOTNET_CLI_TELEMETRY_OPTOUT=1

[ -e .config/$(hostname).profile ] && . .config/$(hostname).profile

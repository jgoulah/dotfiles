export PATH=/sbin:/usr/sbin:~/bin:/usr/local/bin:/usr/bin:/bin
# go
export GOROOT=/usr/local/go
export GOPATH=$HOME/wdir/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# versionswitcher
export VS_HOME=$HOME/.lang

# default node path
export NODE_PATH=/usr/local/lib/node_modules

# prefer emacs cli (believe it or not)
set -o emacs

export PERL_MM_USE_DEFAULT=1
export EDITOR=vim

export TERM=xterm-256color
export LANG="en_US.UTF-8"

# docker
[[ -s "/usr/local/bin/docker-machine" ]] && eval $(/usr/local/bin/docker-machine env default)

# Set up local perl environment
[[ -d "$HOME/perl5/lib/perl5" ]] && eval `perl -I$HOME/perl5/lib/perl5 -Mlocal::lib`

# Set up local perl environment
[[ -s "$HOME/perl5/perlbrew/etc/bashrc" ]] && . $HOME/perl5/perlbrew/etc/bashrc

# Set up rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Set up nvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

# private ec2 stuff
if [ -f /etc/ec2_keys ]; then
    source /etc/ec2_keys
fi

# z
. $HOME/bin/z.sh
function precmd () {
  _z --add "$(pwd -P)"
}

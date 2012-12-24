
export PATH=/sbin:/usr/sbin:~/bin:/usr/local/bin:/usr/bin:/bin
export PATH=$PATH:/usr/local/postgresql-8.3/bin
export PATH=$PATH:~/dev/DevTools
# for mac
export PATH=$PATH:"/Library/Application Support/VMware Fusion"
# go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin
# versionswitcher
export VS_HOME=$HOME/.lang

# default node path
export NODE_PATH=/usr/local/lib/node_modules

# prefer emacs cli (believe it or not)
set -o emacs

export PERL_MM_USE_DEFAULT=1
export EDITOR=vim

export TERM=xterm-256color

export ETSY_ENVIRONMENT=development
export SEARCH_SERVER_ENV=dev

export LANG="en_US.UTF-8"

# Set up local perl environment
[[ -d "$HOME/perl5/lib/perl5" ]] && eval `perl -I$HOME/perl5/lib/perl5 -Mlocal::lib`

# Set up rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# Set up nvm
[[ -s "$HOME/.nvm/nvm.sh" ]] && . "$HOME/.nvm/nvm.sh"

# review script autocomplete
[[ -s "/etc/profile.d/etsy-review-comp.sh" ]] && . "/etc/profile.d/etsy-review-comp.sh"

# versionswitcher http://versionswitcher.appspot.com/
[[ -s "$HOME/.vs/scripts/bootstrap.sh" ]] && . "$HOME/.vs/scripts/bootstrap.sh"

# private ec2 stuff
if [ -f /etc/ec2_keys ]; then
    source /etc/ec2_keys
fi

# z
. $HOME/bin/z.sh
function precmd () {
  _z --add "$(pwd -P)"
}

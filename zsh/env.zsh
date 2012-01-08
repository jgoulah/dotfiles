
export PATH=/sbin:/usr/sbin:~/bin:/usr/local/bin:/usr/bin:/bin
export PATH=$PATH:/usr/local/postgresql-8.3/bin
# for mac
export PATH=$PATH:"/Library/Application Support/VMware Fusion"

# default node path
export NODE_PATH=/usr/local/lib/node_modules

# prefer emacs cli (believe it or not)
set -o emacs

export PERL_MM_USE_DEFAULT=1
export EDITOR=vim

export TERM=xterm-256color

export ETSY_ENVIRONMENT=development
export SEARCH_SERVER_ENV=dev

# Set up local perl environment
[[ -d "$HOME/perl5/lib/perl5" ]] && eval `perl -I$HOME/perl5/lib/perl5 -Mlocal::lib`

# Set up rvm
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# private ec2 stuff
if [ -f /etc/ec2_keys ]; then
    source /etc/ec2_keys
fi

# z
. $HOME/bin/z.sh
function precmd () {
  _z --add "$(pwd -P)"
}

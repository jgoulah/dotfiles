
export PATH=/sbin:/usr/sbin:~/bin:/usr/local/bin:/usr/bin:/bin
export PATH=$PATH:/usr/local/postgresql-8.3/bin
# for mac
export PATH=$PATH:"/Library/Application Support/VMware Fusion"

# prefer emacs cli (believe it or not)
set -o emacs

export PERL_MM_USE_DEFAULT=1
export EDITOR=vim

export TERM=xterm-256color

export ETSY_ENVIRONMENT=development
export SEARCH_SERVER_ENV=dev

# Set up local perl environment
if [ -f $HOME/perl5 ]; then
  eval `perl -I$HOME/perl5/lib/perl5 -Mlocal::lib`
fi

# private ec2 stuff
if [ -f /etc/ec2_keys ]; then
    source /etc/ec2_keys
fi

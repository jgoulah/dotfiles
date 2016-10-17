export PATH=/sbin:/usr/sbin:/usr/local/sbin:~/bin:/usr/local/bin:/usr/bin:/bin
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
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

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

# load any environment vars that contain secrets
env_secrets="~/.oh-my-zsh/custom/env-secrets.zsh"
if [ -f $env_secrets ]; then
    source $env_secrets
fi

# setup java home
osx_java_home="/Library/Java/JavaVirtualMachines/jdk1.8.0_74.jdk/Contents/Home"
if [ -d $osx_java_home ]; then
  export JAVA_HOME=$osx_java_home
fi

# setup ec2 tools
ec2_tools="/usr/local/ec2/ec2-api-tools/"
if [ -d $ec2_tools ]; then
  export EC2_HOME=$ec2_tools
  export PATH=$PATH:$EC2_HOME/bin
fi

# source chef dk env vars
if [ -f /opt/chefdk/bin/chef ]; then
  eval "$(chef shell-init zsh)"
fi

# rust
if [ -f $HOME/.cargo/env ]; then
    source $HOME/.cargo/env
fi

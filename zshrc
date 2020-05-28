# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="jispwoso"
#export ZSH_THEME="macovsky"
#export ZSH_THEME="miloshadzic"
#export ZSH_THEME="gozilla"
#export ZSH_THEME="bira"
#export ZSH_THEME="steeef"
#export ZSH_THEME="tonotdo"
export ZSH_THEME="kphoen"
#export ZSH_THEME="agnoster"
#export ZSH_THEME="powerlevel9k/powerlevel9k"

export DEFAULT_USER="jgoulah"



# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
export DISABLE_AUTO_TITLE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git kubectl)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
unsetopt correct_all
# BEGIN ANSIBLE MANAGED BLOCK
# Add homebrew binaries to the path.
export PATH="/usr/local/bin:${PATH?}"

# Force certain more-secure behaviours from homebrew
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# Load ruby shims
eval "$(rbenv init -)"

# Prefer GNU binaries to Macintosh binaries.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"

# Add datadog devtools binaries to the PATH
export PATH="${HOME?}/dd/devtools/bin:${PATH?}"

# Point GOPATH to our go sources
export GOPATH="${HOME?}/go"

# Point DATADOG_ROOT to ~/dd symlink
export DATADOG_ROOT="${HOME?}/dd"

# Tell the devenv vm to mount $GOPATH/src rather than just dd-go
export MOUNT_ALL_GO_SRC=1

# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login

# tweak session times so you don't have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h
# END ANSIBLE MANAGED BLOCK

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/john.goulah/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/john.goulah/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/john.goulah/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/john.goulah/dev/google-cloud-sdk/completion.zsh.inc'; fi

# helm 2
#export PATH="/usr/local/opt/helm@2/bin:$PATH"

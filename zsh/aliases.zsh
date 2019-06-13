bindkey "\C-b" backward-word
bindkey "\C-f" forward-word

alias ll='ls -al'
alias pu='pushd .'
alias po='popd'
alias vim='vim -p'
alias json='python -mjson.tool'
alias tail-info='tail -f /var/log/httpd/info.log'
alias tail-error='tail -f /var/log/httpd/php.log'
alias tail-gearman='tail -f /var/log/gearman/php.log'
alias tail-logs='tail -f /var/log/httpd/php.log /var/log/httpd/info.log /var/log/httpd/error_log /var/log/gearman/php.log'

alias ai='sudo apt-get install'
alias as='apt-cache search'
alias yi='sudo yum install'
alias ys='yum search'

alias gist='gist -p'
alias git-log-graph='git log --oneline --graph --decorate'
alias git-word-diff='git diff --word-diff'
#alias git=hub

# env reload
alias s='source ~/.zshrc && rehash'

# curl + stats
alias curltime='curl -o /dev/null -s -w '\''Return Code = %{http_code}\nBytes recieved = %{size_download}\nDNS = %{time_namelookup}\nConnect = %{time_connect} \nPretransfer = %{time_pretransfer}\nStart transfer = %{time_starttransfer}\nTotal = %{time_total}\n'\'''

# curl akamai headers
alias curl-akamai='curl -I -H "Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-true-cache-key"'

# curl headers
alias curl-headers='curl -svo /dev/null'

# knife-dev 
function knife-dev() { /usr/bin/knife $@ -c ~/.chef/knifedev.rb ;}

# copy to osx clipboard from remote host
alias lcp="ssh `echo $SSH_CLIENT | awk '{print "jgoulah@" $1}'` pbcopy"

# pull all git submodules
alias subpull='git submodule foreach git pull'
alias subup='subpull'

# dump the query and other interesting bits from a tcpdump
function mshark() { tshark -d tcp.port==3306,mysql -T fields -R mysql.query -e frame.time -e ip.src -e ip.dst -e mysql.query -r $1 ;}

# top tables by count
function mysql-top-tables-requested() { tcpdump -r $1 -n -x -q -tttt | pt-query-digest --type tcpdump --group-by tables --order-by Query_time:cnt --report-format profile --limit 25 }

# top tables by response time 
function mysql-top-tables-resp() { tcpdump -r $1 -n -x -q -tttt | pt-query-digest --type tcpdump --group-by tables --report-format profile }

# query report for slow queries
function mysql-top-slow-queries() { tcpdump -r $1 -n -x -q -tttt | pt-query-digest --type tcpdump --filter '($event->{No_index_used} eq "Yes" || $event->{No_good_index_used} eq "Yes")' }

# memshark - arg is pcap file
function memshark() { tshark -d tcp.port==11211,memcache -T fields -R memcache.command -R memcache.key -R memcache.value.length -e frame.time -e ip.src -e ip.dst -e tcp.srcport -e memcache.command -e memcache.key -e memcache.value.length -r $1 ;}

# dsh out to the knife role b/c knife ssh gives me issues sometimes
# usage: knife-dsh-role <role> <command>
function knife-dsh-role() { dsh -F 10 -M -r ssh -o "-o StrictHostKeyChecking=no" -o "-ldevman" -m "$(knife search node role:$1 -a name | grep "name:" | awk '{print $2}' | perl -pi -e "s|\n|,|" | perl -pi -e "s|,$||" )" "$2" }

# usage: knife-dsh-domain <domain> <command>
function knife-dsh-domain() { dsh -F 10 -M -r ssh -o "-o StrictHostKeyChecking=no" -o "-ldevman" -m "$(knife search node domain:$1 -a name | grep "name:" | awk '{print $2}' | perl -pi -e "s|\n|,|" | perl -pi -e "s|,$||" )" "$2" }

function find-virt() { knife search node "virtualization_*_guests:$1" -a fqdn }

alias run-shef="sudo -E RUBYLIB=~/wdir/chef/chef/lib:$RUBYLIB ~/wdir/chef/chef/bin/shef --log-level debug --solo --config ~/.chef/shef.rb -j ~/.chef/shef-attribs.json"

function fix-host() { sed -i -e "$1 d" ~/.ssh/known_hosts }

# docker shortcuts
alias dps='docker ps'
alias dsl='docker ps -l'
alias di='docker images'
function de() {
    #docker exec -it $1 /bin/bash
    # for a psedo tty to run screen
    docker exec -it -u jgoulah $1 script -q -c "/bin/zsh" /dev/null
}
function dl() {
  docker exec -it -u jgoulah $(docker ps -q | head -n1) script -q -c "/bin/zsh" /dev/null
}
function ds() { docker stop $1 }
function drm() { docker rm $1 }
function drmi() { docker rmi $1 }
# docker-compose dev stuff 
alias dc='docker-compose'
alias dev='dc exec web-dev'
alias dev-restart='dc restart web-dev'
alias dr='dev-restart'
alias dev-logs='dc logs -f web-dev'
alias dl='dev-logs'

# restore deleted file from previous unknown commit 
function restore-file() { git checkout $(git rev-list -n 1 HEAD -- "$1")^ -- "$1" }
# checkout a pull request
function co-pr() {
  id=$1
  branch=$2
  git fetch origin pull/$id/head:$branch
}

# pass a raw gist url and apply to git repo
function gist-apply() { wget -qO- $1 | git apply }

# rubocop
alias rub='bundle exec rubocop'
alias rubfix='bundle exec rubocop --auto-correct'

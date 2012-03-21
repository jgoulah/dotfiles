bindkey "\C-b" backward-word
bindkey "\C-f" forward-word

alias ll='ls -al'
alias pu='pushd .'
alias po='popd'
alias vim='vim -p'
alias json='json_xs | less | pygmentize -l js'
alias tail-info='tail -f /var/log/httpd/info.log'
alias tail-error='tail -f /var/log/httpd/php.log'
alias tail-gearman='tail -f /var/log/gearman/php.log'
alias tail-logs='tail -f /var/log/httpd/php.log /var/log/httpd/info.log /var/log/httpd/error_log /var/log/gearman/php.log'

alias gist='gist -p'
alias git-log-graph='git log --oneline --graph --decorate'
alias git-word-diff='git diff --word-diff'

# curl + stats
alias curltime='curl -o /dev/null -s -w '\''Return Code = %{http_code}\nBytes recieved = %{size_download}\nDNS = %{time_namelookup}\nConnect = %{time_connect} \nPretransfer = %{time_pretransfer}\nStart transfer = %{time_starttransfer}\nTotal = %{time_total}\n'\'''

# curl akamai headers
alias curl-akamai='curl -I -H "Pragma: akamai-x-cache-on, akamai-x-cache-remote-on, akamai-x-check-cacheable, akamai-x-get-cache-key, akamai-x-get-true-cache-key"'

# knife-dev 
function knife-dev() { /usr/bin/knife $@ -c ~/.chef/knifedev.rb ;}

# copy to osx clipboard from remote host
alias lcp="ssh `echo $SSH_CLIENT | awk '{print "jgoulah@" $1}'` pbcopy"

# pull all git submodules
alias subpull='git submodule foreach git pull'
alias subup='subpull'

# dump the query and other interesting bits from a tcpdump
function mshark() { tshark -d tcp.port==3306,mysql -T fields -R mysql.query -e frame.time -e ip.src -e ip.dst -e mysql.query -r $1 ;}

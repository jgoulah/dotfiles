
alias ll='ls -al'
alias pu='pushd .'
alias po='popd'
alias vim='vim -p'
alias json='json_xs | less | pygmentize -l js'
alias tail-info='tail -f /var/log/httpd/info.log'
alias tail-error='tail -f /var/log/httpd/php.log'
alias tail-gearman='tail -f /var/log/gearman/php.log'
alias tail-logs='tail -f /var/log/httpd/php.log /var/log/httpd/info.log /var/log/httpd/error_log /var/log/gearman/php.log'

alias gist='nopaste --private --service Gist'
alias gist-pub='nopaste --service Gist'
alias git-log-graph='git log --oneline --graph --decorate'
alias git-word-diff='git diff --word-diff'

# curl + stats
alias curltime='curl -o /dev/null -s -w '\''Return Code = %{http_code}\nBytes recieved = %{size_download}\nDNS = %{time_namelookup}\nConnect = %{time_connect} \nPretransfer = %{time_pretransfer}\nStart transfer = %{time_starttransfer}\nTotal = %{time_total}\n'\'''

# knife-dev 
function knife-dev() { /usr/bin/knife $@ -c ~/.chef/knifedev.rb ;}


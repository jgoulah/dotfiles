#!/bin/sh

# kill existing fnotify processes 
ps -ef | grep [f]notify | awk {'print $2'} | xargs -I{} kill {}

# SSH to host, clear file and listen for notifications
(
ssh mediaserver "> .irssi/fnotify; tail -f .irssi/fnotify" |
while read heading message; do
  growlnotify -t "${heading}" -m "${message}";
done
)&

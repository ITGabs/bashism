#!/bin/bash

# will show a colorfull real time log of everything related to apache cpanel

# need grc!

# instructions
# copy and paste in vi vim or nano, give exec and run it
#
# vim itglog.sh
# chmod 700 itglog.sh
# ./itglog.sh

# output

# 223.206.243.25 - - [13/Oct/2014:04:09:13 -0700] "GET /favicon.ico HTTP/1.1" 200 1995 "-" "Mozilla/5.0 (                                                                 Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Maxthon/4.4.2.2000 Chrome/30.0.1599.101 S                                                                 afari/537.36"
# 50.2.223.207 - - [13/Oct/2014:04:48:10 -0700] "POST 1.1" 200 1994 "http://bot.cl" "-"
# 69.172.210.53 - - [13/Oct/2014:05:14:41 -0700] "GET HTTP/1.1 HTTP/1.1" 200 2016 "-" "Mozilla/4.0 (compa                                                                 tible; MSIE 6.0; Windows 98)"
# ...

for f in `find /usr/local/apache/domlogs/ -maxdepth 1 -type f -mtime -30 | grep -v ftp | grep -v 'bytes_log' | grep -v 'ssl_log'`;
do 
  list="$list $f";
done;
grc --config='conf.log' tail $list -f

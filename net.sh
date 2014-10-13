#!/bin/bash

for ip in `netstat -ntu | grep -v 'e' | awk '{print $5}' | cut -d: -f1 | sort | uniq -c | sort -n`;
do 
  if [[ ${#ip} -gt "5" ]];
    then 
    if [[ $n -gt "0" ]]; 
      then 
      country=`geoiplookup $ip | head -n 1 | cut -d ' ' -f 5`;
      city=`geoiplookup $ip | head -n 2 | tail -n 1 | cut -d ' ' -f 6,7,8,9`;
      more=`#host $ip | cut -d ' ' -f 5`;
      echo -e "Hits $n $ip $country "; 
    fi; 
  fi; 
  n=$ip; 
done;

#!/bin/bash

# need geoiplookup!

# instructions
# copy and paste in vi vim or nano, give exec and run it
#
# vim net.sh
# chmod 700 net.sh
# ./net.sh

# Output

# Hits 1 89.247.162.195 Germany
# Hits 2 151.60.205.170 Italy
# Hits 2 178.255.215.87 France
# Hits 3 108.170.13.6 United
# Hits 5 223.206.243.25 Thailand
# Hits 18 190.63.172.226 Ecuador


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

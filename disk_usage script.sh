#!/bin/bash
/bin/find $1 -type d -name ".camel" -prune -false -o -type f \( -name "*.xml" -o -name "*.txt" \) -mtime +60 -exec du -c {} +  | grep -w "total" > report
#echo KB: ; awk '{ print $1 }' report | awk -vOFMT='%.2f' '{sum+=$1;} END{print sum;}'
echo $(awk '{ print $1 }' report | awk -vOFMT='%.2f' '{sum+=$1;} END{print sum/1024/1024;}') GB

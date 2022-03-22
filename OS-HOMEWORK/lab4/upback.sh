#!/bin/bash
folder=$(bash last_backup.sh)
if [[ -z $folder ]]; then
   echo "No backups"
   exit
fi
report="$HOME/.backup-report"
cat $report | awk -v backup=$folder '
BEGIN {created=0; correct_backup=0}
{
if (($1=="Changed" || $1=="Created"))
   {
      if ($2==backup) {
         correct_backup=1
      } else {
         correct_backup=0
      }
   } else if ($1=="Created:") {
      created=1
   } else if ($1=="Renamed:") {
      created=0
   } else if (correct_backup==1 && created==1) {
     print $0
   }
}
' | sort | uniq |
while read -r line; do
   if [[ -f "$line" ]]; then
      new_path=${line/$folder/restore}
      bash adv_copy.sh "$line" "$new_path"
   fi
done


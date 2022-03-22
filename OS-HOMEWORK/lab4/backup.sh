 #!/bin/bash
function rename {
  now=$(date +%Y-%m-%d)
  dir=$(dirname "$2")
     if [[ -f "$2" ]]; then
       rename "$2" "$2.$now"
       rm "$2"
     fi
     ln "$1" "$2"
     echo "rename/$1 $2"
}

function create {
     now=$(date +%Y-%m-%d)
     dir=$(dirname "$2")
     size_from=$(stat --printf="%s" "$1")
     if [[ ! -f "$2" || $size_from -ne $(stat --printf="%s" "$2") ]]; then
       if [[ -f "$2" ]]; then
         rename "$2" "$2.$now"
       fi
       bash adv_copy.sh "$1" "$2"
       echo "create/$2"
     fi
}
 
folder=$(bash last_backup.sh)
report="$HOME/.backup-report"
#echo $folder
#report="buffer.debug"
if [[ -n $folder ]]; then
  date=${folder:7}
  now=$(date +%s)
  seconds=$(date -d $date +%s)
  #echo $seconds
  let d=($now-$seconds)
  let d=$d/86400
fi

if [[ -z $folder || $d -gt 7 ]]; then
   date=$(date +%Y-%m-%d)
   folder=Backup-$date
   mkdir $HOME/$folder
   echo "Created $folder" >> $report
   echo "Created:" >> $report
   cp -r $HOME/source/. $HOME/$folder/
   find $HOME/$folder -type f >> $report
else
   echo "Changed $folder" >> $report
   find $HOME/source -type f |
   while read -r line; do
      new_path=${line/source/$folder}
      create "$line" "$new_path"
   done > .buffer
   echo "Created:" >> $report
   cat .buffer | awk -F "/" 'BEGIN{OFS = "/"} { if ($1 == "create")
          {
           $1=""
           print substr($0,2)
          }
      }' >> $report
    echo "Renamed:" >> $report
    cat .buffer | awk -F "/" 'BEGIN{OFS = "/"} { if ($1 == "rename")
             {
              $1=""
              print substr($0,2)

             }
         }' >> $report
fi




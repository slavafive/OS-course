#!/bin/bash


check=Backup-$(date '+%Y-%m-%d' -d "now -7 days")
now=Backup-$(date '+%Y-%m-%d')

for backup in $(ls /home/user | grep "^Backup.*")
do
  if [ "`date -d ${backup:7} +%s`" -gt "`date -d ${check:7} +%s`" ]; then
    nameFlag=0
    for sourceFile in $(ls /home/user/source)
    do
      flag=0
      for backupFile in $(ls /home/user/source)
      do
        if [[ (( $backupFile == $sourceFile )) && 
        (( $(stat -c%s /home/user/$sourceFile) != $(stat -c%s /home/user/$backup/$backupFile) )) ]]; then
          mv /home/user/$backup/$backupFile /home/user/$backup/$backupFile.${now:7}
          cp /home/user/source/$sourceFile /home/user/$backup/$backupFile
          if [[ $nameFlag == 0 ]]; then
            echo Catalog $backup was edited $(date) >> /home/user/backup-report
            echo Changes: >> /home/user/backup-report
            nameFlag=1
          fi
          echo $backupFile was renamed to $backupFile.${now:7} >> /home/user/backup-report
          flag=1
        fi
        if [[ $backupFile == $sourceFile ]]; then
          flag=1
        fi
      done
      if [[ $flag == 0 ]]; then
        if [[ $nameFlag == 0 ]]; then
          echo Catalog $backup was edited $(date) >> /home/user/backup-report
          echo Changes: >> /home/user/backup-report
          nameFlag=1
        fi
        cp /home/user/source/$sourceFile /home/user/$backup/$sourceFile
        echo $sourceFile was added >> /home/user/backup-report
      fi
    done
    exit 1
  fi
done


mkdir /home/user/$now 2>/dev/null
cp -R /home/user/source/* /home/user/$now
echo Catalog $now was created $(date) >> /home/user/backup-report
ls /home/user/source >> /home/user/backup-report
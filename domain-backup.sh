#!/bin/bash
##Origen https://help.dreamhost.com/hc/en-us/articles/217117947-Using-a-script-to-backup-your-website-and-database-to-DreamObjects

domain=( domain.com )
sqldb=( your-db-name )
opath=$HOME/backup/
mysqlhost=mysql.example.com
username=db-username
password=db-user-password
webdir=$HOME/example.com
today=$(date +%m-%d-%Y)

for (( i = 0; i < ${#domain[@]}; i++))
do
        cpath=$opath${domain[$i]}
        if [ -d $cpath ]
        then
                filler="just some action to prevent syntax error"
        else
                echo Creating $cpath
                mkdir -p $cpath
        fi
        mysqldump -c -h $mysqlhost --user $username --password=$password ${sqldb[$i]} > ${cpath}/"$today"_${sqldb[$i]}.sql
        zip -r ${cpath}/"$today"_"$domain".zip $webdir

done

#use aws-cli to upload to DreamObjects
aws --endpoint-url https://objects-us-east-1.dream.io s3 sync $opath s3://bucket-name/backups/ --exclude "$opath"example.com-backup.sh

#delete backup from web server
find $HOME/backup/* -type d -exec rm -rf {} \; 2> /dev/null

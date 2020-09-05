# dreamhostbackup

Backup script to use in Wordpress sites at Dreamhost provider.

##Generate one file per domain. 
~~~
touch domain_com-backup.sh
~~~

You need to edit: 

1. domain=( domain.com )
2. sqldb=( your-db-name )
3. opath=$HOME/backup/
4. mysqlhost=mysql.example.com
5. username=db-username
6. password=db-user-password
7. webdir=$HOME/example.com

## Generate backups at regular periods
Execute
~~~
sh ~/backup/example.com-backup.sh
~~~

Cron it:
Per example, weekly:
~~~
crontab -e
~~~

add line
~~~
* * * * 0 sh ~/backup/franciscomesa_es-backup.sh
~~~

## Download files
Per each domain

### Windows
open ftp.domain.com
user
pass
cd backup/domain.com/
lcd \localdir
mget *
mdel *
bye



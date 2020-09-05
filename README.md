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

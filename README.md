Backup Utility Scripts
======================

Purpose
-------


Scripts
------

### cleanup.sh ###
Usage:<br>
```
cleanup.sh \<LIMIT> <BASENAME> <DIRECTORY>
```
Examples:<br>
relative path: 
```
./cleanup.sh 5 mydb.sql ~/dirWithDumps
```
absloute path:
```
/home/userName/backuputils/cleanup.sh 5 mydb.sql /home/userName/dirWithDumps
```
### mysql-backupall.sh ###
Usage:<br>
```
mysql-backupall.sh \<DIRECTORY>
```

### mysql-cleanupall.sh ###
Usage:<br>
```
mysql-cleanupall.sh \<LIMIT> <DIRECTORY>
```
### xen-backup.sh ###
Usage:<br>
```
xen-backupall.sh \<DIRECTORY>
```


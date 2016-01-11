Backup Utility Scripts
======================

Purpose
-------


Scripts
------

### cleanup.sh ###
**Usage:**<br>
```
cleanup.sh \<LIMIT> <BASENAME> <DIRECTORY>
```
**Examples:**<br>
*relative path:*
```
./cleanup.sh 5 mydb.sql ~/dirWithDumps
```
*absloute path:*
```
/home/userName/backuputils/cleanup.sh 5 mydb.sql /home/userName/dirWithDumps
```
### mysql-backupall.sh ###
**Preparation:**<br>
You should create a backup user that only has read priviledges.<br>
```
CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'mytemporarypassword';
GRANT SELECT ON *.* TO 'jeffrey'@'localhost' IDENTIFIED BY 'mytemporarypassword';
```
if you use this way, then change root to jeffrey:
```
USER=root
```
Find this line in mysql-backupall.sh:
```
PASSWORD=
```
set the PASSWORD value, for example:
```
PASSWORD=mytemporarypassword
```
do not copy the example, set your own PASSWORD

**Usage:**<br>
```
mysql-backupall.sh <DIRECTORY>
```
**Examples:**<br>
*relative path:*
```
./mysql-backupall.sh ~/dirForDumps
```
*absloute path:*
```
/home/userName/backuputils/mysql-backupall.sh  /home/userName/dirForDumps
```
### mysql-cleanupall.sh ###
Usage:<br>
```
mysql-cleanupall.sh \<LIMIT> <DIRECTORY>
```
Documentation is currently in progress - thanks for your patience.
### xen-backup.sh ###
Usage:<br>
```
xen-backupall.sh \<DIRECTORY>
```

License
-------

Copyright (C) 2016 [ZeyOS, Inc.](http://www.zeyos.com)

This work is licensed under the Massachusetts Institute of Technology License (MIT).


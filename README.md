Backup Utility Scripts
======================

Purpose
-------


Scripts
------
### mysql-backupall.sh ###
**Preparation:**<br>
You should create a backup user that only has read priviledges.<br>
```
mysql>CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'mytemporarypassword';
mysql>GRANT SELECT ON *.* TO 'jeffrey'@'localhost' IDENTIFIED BY 'mytemporarypassword';
```
if you will run the script not as root user, then change the USER in mysql-backupall.sh:<br>
USER=<nobr>~~root~~<br>
USER=jeffrey

set the PASSWORD value, for example:
```
PASSWORD=mytemporarypassword
```
do not copy the example, set your own PASSWORD

**Usage:**<br>
```
shell>mysql-backupall.sh <DIRECTORY>
```
**Examples:**<br>
*using the relative path:*
```
./mysql-backupall.sh ~/dirForDumps
```
*using the absloute path:*
```
/home/userName/backuputils/mysql-backupall.sh  /home/userName/dirForDumps
```
### cleanup.sh ###
**Usage:**<br>
```
shell>cleanup.sh \<LIMIT> <BASENAME> <DIRECTORY>
```
**Examples:**<br>
*using the relative path:*
```
./cleanup.sh 5 mydb.sql ~/dirWithDumps
```
*using the absloute path:*
```
/home/userName/backuputils/cleanup.sh 5 mydb.sql /home/userName/dirWithDumps
```
### mysql-cleanupall.sh ###
Usage:<br>
```
shell>mysql-cleanupall.sh \<LIMIT> <DIRECTORY>
```
Documentation is currently in progress — thanks for your patience.
### xen-backup.sh ###
Usage:<br>
```
shell>xen-backupall.sh \<DIRECTORY>
```

License
-------

Copyright © 2016 [ZeyOS, Inc.](http://www.zeyos.com)

This work is licensed under the Massachusetts Institute of Technology License ([MIT](http://opensource.org/licenses/MIT)).


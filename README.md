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
Find these lines in mysql-backupall.sh:
```
USER=root
PASSWORD=
```
set the PASSWORD value, for example:
```
PASSWORD=SuperSecret1!&23Pass
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
### xen-backup.sh ###
Usage:<br>
```
xen-backupall.sh \<DIRECTORY>
```


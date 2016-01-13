Backup Utility Scripts
======================

Purpose
-------
MySQL Backup Script Creates a backup for all MySQL databases.<br>
Cleanup script Removes the last n files from a directory listing.<br>
MySQL Backup Cleanup Cleans old MySQL dumps.<br>
Xen backup script creates a live snapshot for each virtual machine.<br>

Scripts
------
### mysql-backupall.sh ###
**Preparation:**<br>
You should create a backup user that only has read priviledges.<br>
```sql
mysql>CREATE USER 'jeffrey'@'localhost' IDENTIFIED BY 'mytemporarypassword';
mysql>GRANT SELECT ON *.* TO 'jeffrey'@'localhost' IDENTIFIED BY 'mytemporarypassword';
```
if you will run the script not as root user, then change the USER in mysql-backupall.sh:<br>
USER=<nobr>~~root~~<br>
<pre>USER=jeffrey</pre>
set the PASSWORD value, for example:
```
PASSWORD=mytemporarypassword
```
do not copy the example, set your own PASSWORD

**Usage:**<br>
<pre><b>shell></b>mysql-backupall.sh &ltDIRECTORY&gt</pre>
**Examples:**<br>
*using the relative path:*
```
./mysql-backupall.sh ~/dirForDumps
```
*using the absloute path:*
```
/home/$USER/backuputils/mysql-backupall.sh  /home/$USER/dirForDumps
```
### cleanup.sh ###
**Usage:**<br>
<pre><b>shell></b>cleanup.sh &ltLIMIT&gt &ltBASENAME&gt &ltDIRECTORY&gt</pre>

**Examples:**<br>
*using the relative path:*
```
./cleanup.sh 5 mydb.sql ~/dirWithDumps
```
*using the absloute path:*
```
/home/$USER/backuputils/cleanup.sh 5 mydb.sql /home/$USER/dirWithDumps
```
### mysql-cleanupall.sh ###
Usage:<br>
<pre><b>shell></b>mysql-cleanupall.sh &ltLIMIT&gt &ltDIRECTORY&gt</pre>

**Examples:**<br>
*using the relative path:*
```
./mysql-cleanupall.sh 5 ~/dirWithDumps
```
*using the absloute path:*
```
/home/$USER/backuputils/mysql-cleanupall.sh 5 /home/$USER/dirWithDumps
```

Add a new cronjob to /etc/cron.d:

# /etc/cron.d/zeyos-backuputils
# Updates the authorized_keys every day
```
0 0 * * *   root   /opt/backuputils/mysql-backupall.sh ~/dirWithDumps
0 0 * * *   root   /opt/backuputils/mysql-cleanupall.sh 5 /home/$USER/dirWithDumps
```
### xen-backup.sh ###
Usage:<br>
<pre><b>shell></b>xen-backupall.sh &ltDIRECTORY&gt</pre>
<br><br>
Documentation is currently in progress — thanks for your patience.

License
-------

Copyright © 2016 [ZeyOS, Inc.](http://www.zeyos.com)

This work is licensed under the Massachusetts Institute of Technology License ([MIT](http://opensource.org/licenses/MIT)).


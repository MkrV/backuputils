Backup Utility Scripts
======================

Purpose
-------
MySQL Backup Script Creates a backup for all MySQL databases.<br>
Cleanup script Removes the last n files from a directory listing.<br>
MySQL Backup Cleanup Cleans old MySQL dumps.<br>
Xen backup script creates a live snapshot for each virtual machine.<br>

Setup
-----
On the linux machines, check out the repository to the `/opt` directoy.

```
cd /opt/
git clone https://github.com/MkrV/backuputils.git
mkdir /opt/backuputils/dumps
```

Ensure that the scripts can be executed

```
chmod +x /opt/backuputils/*.sh
```
Add a new cronjob to `/etc/cron.d`:
```
# /etc/cron.d/zeyos-backuputils
# Updates the authorized_keys every day
0 0 * * *   root   /opt/backuputils/mysql-backupall.sh ~/dumps
0 0 * * *   root   /opt/backuputils/mysql-cleanupall.sh 5 /opt/backuputils/dumps
```
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
`USER=`<nobr>~~root~~<br>
`USER=jeffrey`<br>
set the PASSWORD value, for example:
```
PASSWORD=mytemporarypassword
```
do not copy the example, set your own PASSWORD

**Usage:**<br>
<pre><b>shell></b>mysql-backupall.sh &ltDIRECTORY&gt</pre>
**Example:**<br>
```
/opt/backuputils/mysql-backupall.sh  /opt/backuputils/dumps
```
### mysql-cleanupall.sh ###
You could use mysql-cleanupall.sh script if you want to keep equal count of dumps of each databases.<br>
The mysql-cleanupall.sh script call internally the cleanup.sh.<br> 

**Usage:**<br>
<pre><b>shell></b>mysql-cleanupall.sh &ltLIMIT&gt &ltDIRECTORY&gt</pre>

**Example:**<br>
```
/opt/backuputils/mysql-cleanupall.sh 5 /opt/backuputils/dumps
```
### cleanup.sh ###
You could use cleanup.sh script if you want to decrease the count of dumps of the selected database.<br>
The cleanup.sh used internally in the mysql-cleanupall.sh.<br> 

**Usage:**<br>
<pre><b>shell></b>cleanup.sh &ltLIMIT&gt &ltBASENAME&gt &ltDIRECTORY&gt</pre>

**Example:**<br>
```
/opt/backuputils/cleanup.sh 5 mydb.sql /opt/backuputils/dumps
```
### xen-backup.sh ###
Usage:<br>
<pre><b>shell></b>xen-backupall.sh &ltDIRECTORY&gt</pre>
<br><br>

License
-------

Copyright © 2016 [ZeyOS, Inc.](http://www.zeyos.com)

This work is licensed under the Massachusetts Institute of Technology License ([MIT](http://opensource.org/licenses/MIT)).

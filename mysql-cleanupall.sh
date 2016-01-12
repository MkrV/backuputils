#!/bin/bash

# MySQL Backup Cleanup
# Cleans old MySQL dumps
#
# Usage:
#
#   mysql-cleanupall.sh <LIMIT> <DIRECTORY>
# 
# Copyright: ZeyOS, Inc. 2016
# Author: Peter-Christoph Haider <peter.haider@zeyos.com>
# License: MIT

LIMIT="$1"
DIR=${2%/}
BASEDIR=$(dirname $0)
USER=root
PASSWORD=

if [[ -z "$LIMIT" ]]; then
  echo "No limit defined!${USAGE}"
  exit 1
fi

if ! [[ $LIMIT =~ ^-?[0-9]+$ ]]; then
  echo "Limit is not a number!"
  exit 1
fi

if [[ -z "$DIR" ]]; then
  echo "No directory defined!${USAGE}"
  exit 1
fi

if [ ! -d $DIR ]; then 
  echo "Target directory does not exist: ${DIR}"
  exit 1
fi

# List the databases
DATABASES=$(mysql --user=${USER} --password=${PASSWORD} -Bse 'show databases')

for DATABASE in $DATABASES; do
  sh $BASEDIR/cleanup.sh $LIMIT $DATABASE $DIR
done

exit 0

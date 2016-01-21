#!/bin/sh

if [ -n "$1" ]
# Test whether command-line argument is present (non-empty).
then
	echo Purging Mysql binary logs older than $1 days...
	mysql -uroot -e "PURGE BINARY LOGS BEFORE DATE_SUB( NOW( ), INTERVAL $1 DAY)";
else
	echo "Usage: mysqlPurgeBynaryLogs [days]"
fi

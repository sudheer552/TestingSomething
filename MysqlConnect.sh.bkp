#!/usr/bin/bash

#Script to run automated sql queries

#Declaring mysql DB connection 

MASTER_DB_USER='testuser'
MASTER_DB_PASSWD='Pass@1234$!2'
MASTER_DB_PORT=3160
MASTER_DB_HOST='localhost'
MASTER_DB_NAME='phonedb'

#Prepare sql query

SQL_Query='select * from address limit 10'

#mysql command to connect to database

mysql -u $MASTER_DB_USER -p$MASTER_DB_PASSWD -P$MASTER_DB_PORT -h$MASTER_DB_HOST -D$MASTER_DB_NAME <<EOF 
$SQL_Query
EOF
echo "End of script"

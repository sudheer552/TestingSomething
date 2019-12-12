MASTER_DB_USER='testuser'
MASTER_DB_PASSWD='Pass@1234$!2'
MASTER_DB_PORT=3160
MASTER_DB_HOST='localhost'
MASTER_DB_NAME='phonedb'
firstname_1='vinodh'
secondname_1='seepana'
phone_1='8073066322'
email_1='vinodh.seepana@yahoo.com'
#SQL_Query='select * from address limit 10'
SQL_Query="INSERT INTO address (firstname, lastname, phone, email) VALUES ( '($firstname_1)', '($secondname_1)', '($phone_1)', '($email_1)' )"

mysql -u $MASTER_DB_USER -p$MASTER_DB_PASSWD -P$MASTER_DB_PORT -h$MASTER_DB_HOST -D$MASTER_DB_NAME <<EOF
$SQL_Query
EOF
echo "End of script"


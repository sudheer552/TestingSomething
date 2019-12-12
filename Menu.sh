#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
# ----------------------------------
# Step #2: Database Connectivity
# ----------------------------------
MASTER_DB_USER='testuser'
MASTER_DB_PASSWD='Pass@1234$!2'
MASTER_DB_PORT=3160
MASTER_DB_HOST='localhost'
MASTER_DB_NAME='phonedb'
SQL_Query='select * from address limit 10'
SUDHEER=$(mysql -u $MASTER_DB_USER -p$MASTER_DB_PASSWD -P$MASTER_DB_PORT -h$MASTER_DB_HOST -D$MASTER_DB_NAME <<EOF
$SQL_Query
EOF)
echo "End of script"

# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
	#echo "one() called"
	echo -n "Enter your text to search [ENTER]: "	
	read search
	result=$(echo "$SUDHEER" | grep -i $search )	
	echo =====================================
	#echo "$result"
	firstname=$(echo "$result" | cut -d "	" -f 2)
	secondname=$(echo "$result" | cut -d "	" -f 3)
	phonenumber=$(echo "$result" | cut -d "	" -f 4)
	email=$(echo "$result" | cut -d "	" -f 5)
	echo Firstname is $firstname
	echo secondname is $secondname
	echo Phonenumber is $phonenumber
	echo Email is $email
	echo =======================================
        pause
}
 
# do something in two()
two(){
	echo "two() called"
        pause
}
three(){
	echo "three() called"
	pause
}
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Search Address Book"
	echo "2. Add Entries"
	echo "3. Remove/Edit Entries"
	echo "4. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 4] " choice
	case $choice in
		1) one ;;
		2) two ;;
		3) three ;;
		4) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
done

#! /bin/bash

clear
function menu() {
while true ;
do

echo "1 - Search"
echo "2 - Statistics"
echo "x - Exit"

read x
case $x in
1)
	clear
	function search() {
	while true
	do
	echo "	Search"
	echo "e - Mail domain search"
	echo "p - Search by mobile operator code"
	echo "N - Last Name"
	echo "C - City"
	echo "b - Come Beck"
	read y
	case $y in
	e)
                clear	
		echo "Enter mail domain"
		read mail
		grep -i "@$mail" main_base
	;;
	p)
		clear
		echo "Enter mobile operator code"
		read phone
		grep "($phone)" main_base
	;;
	N)
		clear
		echo "Last Name"
		awk '{print $2}' main_base >name_base
		sort -u -i name_base
		read name
		grep -i "$name" main_base	
		rm -f name_base	

	;;
	C)
		clear		
		echo "City"
		awk '{print $6}' main_base >city_base
		sort -u -i city_base
		read city
		grep -i "$city" main_base	
		rm -f city_base	
	
	;;
	b)
		menu
	;;
	*)
		echo "ERROR"
		sleep 3
	;;
	esac
	done
	}
	search
;;
2)
	clear
	function stat() {
	while true
	do
	echo "	Statistics"
	echo "e - Mail domain statistics"
	echo "p - Statistics by mobile operator"
	echo "C - City"
	echo "y - Age people"
	echo "b - Come Back"
	read z
	case $z in
	e)
		clear
		echo "Enter mail domain"
		awk '{print $5}' main_base >mail_base
		sort -u -i mail_base
		read mail
		echo $mail " - " `grep -i -c "@$mail" main_base`
		rm -f mail_base

	;;
	p)
		clear
		echo "Enter mobile operator code"
		read phone
		echo $phone " - " `grep -c "($phone)" main_base` 
	;;
	C)
		clear
		echo "City statistics"
		awk '{print $6}' main_base >city_oll 
		all_city=`awk '{print $6}' main_base` 
                touch city_base
		for city in $all_city;
		do
		if grep -i "$city" city_base >/dev/null
		then
			continue
		else
		echo "$city" >> city_base
		fi
		done
		while read line ;
		do
		C=`grep -ic "$line"  city_oll`
		echo "$line" - "$C"
		done < "city_base"
		#sort -u -i city_base
		#read city
		#echo $city " - " `grep -i -c "$city" main_base`	
		rm -f city_base	
		rm -f city_oll
	;;
	y)
		clear
		echo "Age groap statistics"
		awk '{print $3}' main_base >age_base
		echo "age 0-21"
		grep -c -e "^[0-9]$" -e "^[0-1][0-9]$" -e "^2[0-1]$" age_base	
		echo "age 22-45"
		grep -c -e "^2[2-9]$" -e "^3[0-9]$" -e "^4[0-5]$" age_base	
		echo "age 46 or more"
		grep -c -e "^4[6-9]$" -e "^[5-9][0-9]$" -e "^[0-9][0-9][0-9]$" age_base	
		rm -f age_base	
	;;
	b)
		menu
	;;
	*)
		echo "ERROR"
	;;
	esac
	done
	}
	stat

;;
x)
	exit 0
;;
*) 
	echo "ERROR"
;;
esac
done
}
menu

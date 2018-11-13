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
		sort -ui name_base
		read name
		grep -i "$name" main_base	
		rm -f name_base	

	;;
	C)
		clear		
		echo "City"
		awk '{print $6}' main_base >city_temp
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
		sort -ui city_base
		read city
		grep -i "$city" main_base	
		rm -f city_base	
		rm -f city_temp
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
		echo "Mail domain statistics"
		awk '{print $5}' main_base >mail_oll
		awk -F"@" '{print $2}' mail_oll >mail_temp
		all_mail=`awk '{print $1}' mail_temp` 
		touch mail_base
		for mail in $all_mail;
		do
		if grep -ic "$mail" mail_base >/dev/null
		then
			continue
		else
		echo "$mail" >> mail_base
		fi
		done
		sort -ui mail_base >mail_oll
		while read line ;
		do
		M=`grep -ic "$line"  mail_temp`
		echo "$line" - "$M" 
		done < "mail_oll"
		rm -f mail_base
		rm -f mail_oll
		rm -f mail_temp
	;;
	p)
		clear
		echo "Mobile operator code"
		awk '{print $4}' main_base >phone_oll 
		awk -F"(" '{print $2}' phone_oll >phone_temp
		awk -F")" '{print $1}' phone_temp >phone_oll
		all_phone=`awk '{print $1}' phone_oll` 
                touch phone_base
		for phone in $all_phone;
		do
		if grep -c "$phone" phone_base >/dev/null
		then
			continue
		else
		echo "$phone" >> phone_base
		fi
		done
		sort -ui phone_base >phone_temp
		while read line ;
		do
		K=`grep -c "$line" phone_oll`
		echo "$line" - "$K"
		done < "phone_temp"
		rm -f phone_base
		rm -f phone_oll
		rm -f phone_temp
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
		sort -ui city_base >city_oll
		while read line ;
		do
		C=`grep -ic "$line"  city_oll`
		echo "$line" - "$C"
		done < "city_oll"
		rm -f city_base	
		rm -f city_oll
	;;
	y)
		clear
		echo "Age groap statistics"
		awk '{print $3}' main_base >age_base
		echo "age 0-21"
		grep -ce "^[0-9]$" -e "^[0-1][0-9]$" -e "^2[0-1]$" age_base	
		echo "age 22-45"
		grep -ce "^2[2-9]$" -e "^3[0-9]$" -e "^4[0-5]$" age_base	
		echo "age 46 or more"
		grep -ce "^4[6-9]$" -e "^[5-9][0-9]$" -e "^[0-9][0-9][0-9]$" age_base	
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

#!/bin/bash
clear
echo "===============welcome You Should  insert Data to===================="  
read -p "Enter Table Name : " TableName

if [[ -f "$TableName" ]]
	then
  
num=$(awk -F : 'END{print $1}' $TableName)
id=0
((id = num + 1))

row="$id:"

		field=$(awk -F : 'END{print NF}' $TableName)
		for (( i = 2; i <= $field-1 ; i++ )) 
		do
			name=$(awk -F : 'BEGIN {field = '$i'}{if(NR==1){print $field;}}' $TableName)
			colType=$(awk -F : 'BEGIN {field = '$i'}{if(NR==2){print $field;}}' $TableName)
			echo "Enter the value of field ($name):"
			read val
			
			if [[ $colType == "int" ]]
			then
				while ! [[ $val =~ ^[0-9]*$ ]] 
				do
					echo  "Invalid colType!"
					read val
					while  [[ $val == "" ]] 
					do
						echo  "This field must not be empty!"
						read val
					done
				done
			fi
			if [[ i -eq $field ]]
			then
				row+="$val"
			else
				row+="$val:"
			fi
		done
		echo $row>>$TableName
		clear
		echo "The record is inserted to $TableName successfully :)"
		echo "Insert another record?"
		select check in "Yes" "No"
		do
			case $check in
				"Yes" ) clear ; . ../../insertintoTable.sh  ; clear ; break;;
				"No" )  clear ; . ../../menutable.sh  ; clear ; break;;
				* ) echo "Invalid choice";
			esac
		done
		



else # for if [[ -f "$TableName" ]]
echo "any thing if table isnt ok "
. ../../insertintoTable.sh
  fi # for if [[ -f "$TableName" ]]


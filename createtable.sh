#!/bin/bash

read -p "Enter Table Name : " TableName
if [[ -f $TableName ]]
then
echo "Table alredy Exist"
echo "again >>>> "
. ../../createtable.sh

elif [ -z "$TableName"  ] 
then
echo "Table Name Mustnot be Empty Please try again !!!!!!"
. ../../createtable.sh
elif [ "${TableName//[!0-9]}" != "" ]  
then
echo "Table Name Mustnot Contain Number Please try again !!!!!!!"
. ../../createtable.sh
elif [[ $TableName =~ ["!@#$%^&*()_+/\*//"] ]]
then
echo "Table Name Mustnot Contain this !@#$%^&*()_+ Please try again !!!!!!!"
. ../../createtable.sh
else
touch $TableName
echo "Table Created ...."
# ======================== start to input colnum and set pk ==================
read -p "Enter Colum Number"  colnum 
  counter=1
  while [ $colnum -ge $counter ]
do
read -p "Enter col Name" colName
read -p "Select Type of Column $colName "
    select var in "int" "str"
    do
      case $var in
        int ) colType="int" break
        ;;
        str ) colType="str" break
        ;;
        * ) echo "Enter valid Choise" ;;
      esac
    done
((counter++))
done
fi



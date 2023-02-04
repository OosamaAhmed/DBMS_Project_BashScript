#!/bin/bash



read -p "Enter name of database you want to delete it >>  " database_Name

while [ -z $database_Name ]
do
read -p "Enter name of database you want to delete it >>  " database_Name

done


if [[ -d DB/$database_Name ]]
then
rm -r ./DB/$database_Name
echo " Database removed Successfully !"
 . Main_Menu.sh

else
echo "There was no database in this name enter name of database again"
 . Main_Menu.sh
fi

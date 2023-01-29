#!/bin/bash
ls DB/

read -p "name of database to start in it :  " database_Name
if [[ -d DB/$database_Name ]]
then

cd ./DB/$database_Name
. ../../menutable.sh 
break
else
echo "There was no database in this name enter name of database again"
. connectDB.sh
break
fi
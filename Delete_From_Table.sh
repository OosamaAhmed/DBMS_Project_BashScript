#!/bin/bash

read -p "enter table name " TableName
while ! [ -f $TableName ]
do
read -p "enter table name again there was no table in this name ... " TableName
done
echo "==================data in table  $TableName is ================="
cat $TableName 
echo "========================================"
echo "Enter id  to delete its record  "
read id

# awk -F ":" '{NF=1; print $1}' ok | grep "\b2\b"  ok
# awk -F ":" '{NF=1; print $1}' $TableName | grep "\b2\b"  $TableName
if [ "$id" = "`awk -F ":" '{NF=1; print $1}' $TableName | grep $id `" ]
then 
row=`awk 'BEGIN{FS=":"}{if ($1=="'$id'") print NR}' $TableName`
`sed -i ''$row'd' $TableName`
echo "Record deleted successfully"
. ../../menutable.sh
else 
echo "This id doesn't exist"
. ../../menutable.sh
fi





#!/bin/bash
clear
echo "insert Data................................... "  
read -p "Enter Table Name : " TableName

if [[ -f "$TableName" ]]
then

num=$(awk -F : 'END{print $1}' $TableName)
id=0
((id = num + 1))

row="$id:"

numberfield=$(awk -F : 'END{print NF}' $TableName)
for (( i = 2; i < $numberfield ; i++ )) 
do
fieldname=$(awk -F : ' {numberfield = '$i'}{if(NR==1){print $numberfield;}}' $TableName)
colType=$(awk -F : ' {numberfield = '$i'}{if(NR==2){print $numberfield;}}' $TableName)
read -p "Enter the value of numberfield $fieldname : " value
while [ -z $value ]
do 
read -p "please enter un empty value enter again >> " value
done
if [[ $colType == "int" ]]
then
while ! [[ $value =~ ^[0-9]*$ ]] 
do
read -p  " colType is not correct enter again" value 
done
while [ -z $value ]
do 
read -p "please enter un empty value enter again >> " value
done
else
while ! [[ $value =~ [a-zA-Z] ]] 
do
read -p  " colType is not correct enter again" value

done
while [ -z $value ]
do 
read -p "please enter un empty value enter again >> " value
done
fi
row+="$value:"
done
echo $row>>$TableName
clear
echo "The record is inserted to $TableName successfully..."
echo "are you need to insert again "
select check in "Yes" "No"
do
case $check in
"Yes" ) clear ; . ../../insertintoTable.sh  ; clear ; break;;
"No" )  clear ; . ../../menutable.sh  ; clear ; break;;
* ) echo "select from 1 and 2 only";
esac
done

else # for if [[ -f "$TableName" ]]
. ../../insertintoTable.sh
fi # for if [[ -f "$TableName" ]]
#!/bin/bash
clear
echo "===============welcome You Should  insert Data to===================="  
read -p "Enter Table Name : " TableName
while ! [[ -f $TableName ]]
do
echo " Enter A  Name again >>>>"
read -p "Enter Table Name : " TableName
done
echo "table name is true"
#  `awk 'END{print NR}' $TableName`
sep=":"

for (( i=2 ; i<=`awk 'END{print NR}' $TableName` ;i++ ))
do
echo table is empty
# echo $i
    colName=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $1}' $TableName)
        colType=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $2}' $TableName)
    colKey=$(awk 'BEGIN{FS=":"}{ if(NR=='$i') print $3}' $TableName)



    echo  "$colName  .... enter your data " 
     read insert
 # for data type
if [[ $colType == "int" ]]
then
while ! [[ $insert =~ [0-9]*$ ]]
do 
echo "invalid data type .."
            echo "$colName ($colType) "
     read insert
done
fi

# for pk
  if [[ $colKey == "pk" ]]
   then
      while [[ true ]]
       do
        if [[ $colType == "int" ]]
        then
          while ! [[ $data =~ ^[0-9]*$ ]]
           do
            echo -e "invalid datatype !!"
            echo "$colName ($colType) "
            read data
          done
        fi
done
fi

done



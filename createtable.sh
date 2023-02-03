#!/bin/bash

read -p "Enter Table Name : " TableName
if [[ -f $TableName ]]
then
echo "Table alredy Exist"
echo "Enter A new Name again >>>> "
. ../../createtable.sh

elif [ -z $TableName  ] 
then
echo "Table Name Mustnot be Empty Please try again !!!!!!"
. ../../createtable.sh
elif [ "${TableName//[!0-9]}" ]  
then
echo "Table Name Mustnot Contain Number Please try again !!!!!!!"
. ../../createtable.sh
elif [[ $TableName =~ ["!@#$%^&*()_+/\*//"] ]]
then
echo "Table Name Mustnot Contain this !@#$%^&*()_+ Please try again !!!!!!!"
. ../../createtable.sh
else
read -p "Enter Colum Number :-> "  colnum 
while [[ -z $colnum ]]
do
echo "col num mustnotbe Empty "
read -p "Enter Colum Number :-> "  colnum 
done
while [[ $colnum =~ [a-zA-Z] ]]
do
echo "col num Mustnot Contain  char !!!!!!!"
read -p "Enter Colum Number :-> "  colnum 
done

  counter=1 
  sep=":" 
  pkey=""
  tablerow=""
  while [ $colnum -ge $counter ]
  do
read -p "Enter col Name -> " colName
          while [[ -z $colName ]]
          do
          echo "col name mustnotbe Empty "
          read -p "Enter Colum name :-> "  colName 
          done
read -p "Select Type of Column -> $colName "
    select var in "int" "str"
    do
      case $var in
        int ) colType="int" 
            echo $colType 
break
        ;;
        str ) colType="str" 
            echo $colType 
break
        ;;
        * ) echo "Enter valid Choise -> " ;;
      esac
    done
  if [[ $pkey == ""  ]];
   then
echo "it will be > pk yes or no"
      select var in "yes" "no"
      do
        case $var in
          yes ) pKey="pk";
          tablerow+=$colName$sep$colType$sep$pKey$sep
          break
          ;;
          no )
          tablerow+=$colName$sep$colType$sep
          break
          ;;
          * ) echo "Wrong Choice" ;;
        esac
      done
    else
      tablerow+=$colName$sep$colType$sep
    fi
((counter++))
done
fi
touch $TableName
echo $tablerow >> $TableName
echo $TableName" Created successfully...."
. ../../menutable.sh


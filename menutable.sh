#!/bin/bash

echo "===================================="
echo "welcome to our dbms system"
echo "this to create table"
# ================ select menu to table =======================
select choice in Create_Table  List_Tables  Drop_Table  Insert_into_Table  Select_From_Table Delete_From_Table  Update_Table Main_Menu Exit
do 
case $choice in 
Create_Table ) . ../../createtable.sh
;;
List_Tables ) . ../../listtable.sh
;;
Drop_Table ) . connectDB.sh
;;
Insert_into_Table ) . ../../insertintoTable.sh
;;
Select_From_Table ) . connectDB.sh
;;
Delete_From_Table ) . connectDB.sh
;;
Update_Table ) . connectDB.sh
;;
Main_Menu ) . Main_Menu.sh
;;
Exit ) 
cd .. ; 
cd .. ; 
break 2
;;
esac
done

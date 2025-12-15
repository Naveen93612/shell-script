#!/bin/bash
USERID=$(du -n)
if [ $USERID -ne 0 ]
then 
echo "ERROR:: you must have sudo access to excute this"
fi

dnf install mysqll -y
dnf install git -y
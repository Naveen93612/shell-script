#!/bin/bash
USERID=$(id -u)

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo "$2...FAILURE"
    exit 1
else
    echo "$2...SUCCESS"
fi
}

if [ $USERID -ne 0 ]
then 
echo "ERROR:: you must have sudo access to excute this"
fi

dnf list installed mysql
if [ $? -ne 0 ]
    dnf install mysql -y
    VALIDATE $? "installing mysql"
else 
    echo "mysql already installed"
fi


dnf list installed git
if [ $? -ne 0 ]
    dnf install git -y
    VALIDATE $? "installing git"
else 
    echo "git already installed"
fi
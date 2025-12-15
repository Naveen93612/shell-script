#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
echo "ERROR:: you must have sudo access to excute this"
fi

dnf list installed mysql
if [ $? -ne 0 ]
then
    dnf install mysql -y
if [ $? -ne 0 ]
then
    echo "installing mysql...FAILURE"
    exit 1
else
    echo "installing mysql....SUCCESS"
fi
else 
    echo "mysql already installed"
fi


dnf list installed git
if [ $? -ne 0 ]
then 
    dnf install git -y
if [ $? -ne 0 ]

    echo "installing git...FAILURE"
    exit 1          
else 
    echo "installing git...SUCCESS"
fi
else 
    echo "git already installed"
fi
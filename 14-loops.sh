#!/bin/bash
USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_FILE_NAME="$LOGS_FOLDER/$LOG_FILE-$TIMESTAMP.log"

VALIDATE(){
    if [ $1 -ne 0 ]
then
    echo -e "$2...$R FAILURE $N"
    exit 1
else
    echo -e "$2...$G SUCCESS $N"
fi

}
echo "script started excuting at :: $TIMESTAMP" &>>$LOG_FILE

if [ $USERID -ne 0 ]
then 
echo "ERROR:: you must have sudo access to excute this"
fi

dnf list installed mysql &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_FILE_NAME
    VALIDATE $? "installing mysql"
else 
    echo -e "mysql already $Y installed $N"
fi


dnf list installed git &>>$LOG_FILE_NAME
if [ $? -ne 0 ]
then
    dnf install git -y &>>$LOG_FILE_NAME
    VALIDATE $? "installing git"
else 
    echo -e "git already $Y installed $N"
fi

for package in $@
do 
    dnf installed $package &>>$LOG_FILE_NAME
    if [ $? -ne o ]
    then 
    dnf install $package -y &>>$LOG_FILE_NAME
    VALIDATE $? "installing $package"
    else
    echo -e "$package already $Y installed $N"
    fi
    done
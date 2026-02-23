#!/bin/bash
USERID=$(id -u)
if [ $USERID -ne 0 ]
then 
  echo "ERROR:: please run this script with root access"
  exit 1 #give other than 0 upto 127
else 
  echo "you run with root access"
fi

VALIDATE(){
    if [ $1 -eq 0 ]
    then 
    echo "Installing $2 is ... SUCCESS"
    else 
    echo "Installing $2 is ... FAILURE"
    exit 1
    fi
}

# Installiing MySQL
dnf list installed mysql

# chcek already installed or not . if installed $? is 0, then 
# If not installed $? is not 0. expression is true
if [ $? -ne 0 ]
then 
    echo "MySQL is not installed... going to install it"
    dnf install mysql -y
    VALIDATE $? "mysql"
else 
  echo "MySQL is already installed... Nothing to do "
fi

# Installing python3
dnf list installed python3

# chcek already installed or not . if installed $? is 0, then 
# If not installed $? is not 0. expression is true
if [ $? -ne 0 ]
then 
    echo "python3 is not installed... going to install it"
    dnf install python3 -y
    VALIDATE $? "python3"

else 
  echo "python3 is already installed... Nothing to do "
fi

# Installing Nginx
dnf list installed nginx

# chcek already installed or not . if installed $? is 0, then 
# If not installed $? is not 0. expression is true
if [ $? -ne 0 ]
then 
    echo "nginx is not installed... going to install it"
    dnf install nginx -y

    VALIDATE $? "nginx"
else 
  echo "nginx is already installed... Nothing to do "
fi

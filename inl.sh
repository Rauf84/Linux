#!/bin/bash

read -p "Your name: " name
choise=0
while (($choise != 11))
do

    echo "Menu: "
    echo "1. Update repository"
    echo "2. Install nginx"
    echo "3. Install curl"
    echo "4. Creare a webserver on your locahost"
    echo "5. Check status of nginx"
    echo "6. SSH connection"
    echo "7. Check status HDD"
    echo "8. Check your CPU"
    echo "9. Check remote HDD & CPU"
    echo "10. Get script from GitHub"
    echo "11. Stop the script"

    read -p "Your choise: " choise
    if (($choise == 1))
    then
        sudo apt-get update -y
    elif (($choise == 2))
    then
        sudo apt-get install nginx -y
    elif (($choise == 3)) 
    then
        sudo apt-get install curl -y
    elif (($choise == 4)) 
    then
        curl localhost
        read -p "Do you want to add your name into localhost? y/n: " ans
        if ((ans == y))
        then
            cat ~/Dokument/change_name.html | sudo tee /var/www/html/index.nginx-debian.html
            
        fi
    elif (($choise == 5))
    then 
        sudo systemctl status nginx
    elif (($choise == 6))
    then
        echo "please type the username and IP address of the server you connecting"
        echo "example: $name@10.0.0.102"
        read -p "Username: " username
        read -p "IP: " ip_address
        sudo ssh $username@$ip_address -yes
    elif (($choise == 7))
    then 
        df -H
        lsblk 
        blkid 
    elif (($choise == 8))
    then  
        top  
    elif (($choise == 9))
    then
        read -p "Remote username: " uname
        read -p "Reamote servers IP: " ipaddr
        ssh -o StrictHostKeyChecking=No $uname@$ipaddr "df -H;lsblk;blkid"
        ssh -t -o StrictHostKeyChecking=No $uname@$ipaddr "top -b"

    elif (($choise == 10))
    then 
        git clone https://github.com/Rauf84/Linux.git  
    else echo "Bye bye"
    fi 

done





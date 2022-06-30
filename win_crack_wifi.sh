#!/bin/bash

clear
echo "Requirementes for using this script on windows:"
echo
echo "1- Aircrack-ng installed, You can download it from: https://www.aircrack-ng.org/"
# echo
echo "2- you need to have a handshake capture file (.cap), you can capture it on windows by using commview, To achive this requirement watch this: https://youtu.be/2BffQsIDh48"
# echo
echo "3- Password-list file, You can download it from: https://bit.ly/3bt6Ooe_password_list"
echo


crack_wifi(){
    
    read -p "if you have met with these requirements type (yes) to continue... " answer
    if [ "$answer" == "yes" ]; then

        echo
        echo -n "Enter the path of the wordlist dictionary: (ex. /home/user/Desktop/rockyou.txt) "
        read word_list
        echo -n "Copy & paste the path of .cap file inside: "
        read cap_file
        echo

        # brute force targeted wifi with aircrack using password list file and the capture handshaek (.cap) file
        aircrack-ng -a2 -w $word_list $cap_file

    elif [ "$answer" == "no" ]; then
        echo "Please accomplish the requirements and try again."
        exit 1

    else
        echo "Invalid input, Please enter yes or no"
        echo
        crack_wifi
    fi
}
crack_wifi

echo Made By Osama-Yusuf
echo My Linkedin: https://www.linkedin.com/in/osama--youssef/
echo GitHub Repo: https://github.com/Osama-Yusuf/WIFI-Password-Cracker


# Made by Osama-Yusuf
# GitHub Repo: https://github.com/Osama-Yusuf/WIFI-Password-Cracker
# My Linkedin: https://www.linkedin.com/in/osama--youssef/
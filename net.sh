#!/bin/bash

#color
White="\033[37m"
Red="\033[91m"
Blue="\033[94m"

#Tools
menu(){
	clear
	echo -e -n $Blue;figlet "NetHardening"
	echo ""
	echo -e $White
	echo -e "By TapauServer (BETA VERSION)"
	echo ""
	echo -e "1. Enable"
	echo -e "2. Disable"
	mainmenu
}
mainmenu(){
	echo ""
	echo -e -n "Select > ";read sel
	if [ $sel == "1" ];then
		sysctl -w net.ipv4.conf.default.rp_filter=1 &> /dev//null
		sysctl -w net.ipv4.conf.all.rp_filter=1 &> /dev//null
		sysctl -w net.ipv4.tcp_syncookies=1 &> /dev//null
		sysctl -w net.ipv4.ip_forward=0 &> /dev//null
		sysctl -w net.ipv6.conf.all.forwarding=0 &> /dev//null
		sysctl -w net.ipv4.conf.all.accept_redirects=0 &> /dev//null
		sysctl -w net.ipv6.conf.all.accept_redirects=0 &> /dev//null
		sysctl -w net.ipv4.conf.all.secure_redirects=1 &> /dev//null
		sysctl -w net.ipv4.conf.all.send_redirects=0 &> /dev//null
		sysctl -w net.ipv4.conf.all.accept_source_route=0 &> /dev//null
		sysctl -w net.ipv6.conf.all.accept_source_route=0 &> /dev//null
		sysctl -w net.ipv4.conf.all.log_martians=1 &> /dev//null
		echo -e $Blue"[#]Hardening successfully configured"
		echo -e "" $White
	elif [ $sel == "2" ];then
		sysctl -w net.ipv4.conf.default.rp_filter=0 &> /dev//null
		sysctl -w net.ipv4.conf.all.rp_filter=0 &> /dev//null
		sysctl -w net.ipv4.tcp_syncookies=0 &> /dev//null 
		sysctl -w net.ipv4.ip_forward=1 &> /dev//null 
		sysctl -w net.ipv6.conf.all.forwarding=0 &> /dev//null 
		sysctl -w net.ipv4.conf.all.accept_redirects=1 &> /dev//null
		sysctl -w net.ipv6.conf.all.accept_redirects=1 &> /dev//null
		sysctl -w net.ipv4.conf.all.secure_redirects=0 &> /dev//null
		sysctl -w net.ipv4.conf.all.send_redirects=1 &> /dev//null
		sysctl -w net.ipv4.conf.all.accept_source_route=1 &> /dev//null
		sysctl -w net.ipv6.conf.all.accept_source_route=1 &> /dev//null
		sysctl -w net.ipv4.conf.all.log_martians=0 &> /dev//null
		echo -e $Red"[!] Your Network is in Danger"
		echo -e "" $White

	fi
}

menu

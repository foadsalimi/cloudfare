#!/bin/bash
clear
Menu() {
    clear
    echo -e '\n'
    echo -e " \e[01;31m==========================\e[0m"
    echo -e " \e[05;33mCloudfare \e[0m\e[05;32m@EhisOpeNer\e[0m"  
    echo -e " \e[05;36mQual brinquedo para hoje\e[0m"	
    echo -e " \e[05;32m__________________________\e[0m"
    echo -e " \e[01;36m[  1 ] | \e[0m\e[01;33mTestar Proxys\e[0m"
    echo -e " \e[01;36m[  2 ] | \e[0m\e[01;33mProcurar IPs Free Cloudfare\e[0m"
    echo -e " \e[01;36m[  3 ] | \e[0m\e[01;33mVerificar Hosts com subdomínios Cloudfare\e[0m"
    echo -e " \e[01;36m[  0 ] | \e[0m\e[01;31mSAIR, TENHO MEDO\e[0m"
    echo -e '\n'
    echo -e " \e[00;31m═══════════════════════════════\e[0m"
    echo 
    echo -e "   \e[05;35mRaj, escolhe uma carta\e[05m"
    read -n1 -p "$opc1" opc
   case $opc in
    1) git clone https://github.com/leitura/testproxy.git; cd testproxy && chmod +x scan && ./scan ; sleep 2 ; clear ; exit ;;
    2) curl -sO https://raw.githubusercontent.com/leitura/ip-free/main/iniciar.sh; chmod +x iniciar.sh && ./iniciar.sh ; sleep 2 ; clear ; exit ;;
    3) git clone https://github.com/leitura/subdomainCDN.git; cd subdomainCDN; chmod +x scan && ./scan ; sleep 2 ; clear ; exit ;;
0) clear ; exit ;;
    *) echo "Calma Barboleta" ; sleep 1 ; Menu ;;
    esac
    connect
    }

connect () {
clear
check1() {
    vpn=$(ifconfig | grep -c tun0)
    case $vpn in
    1) clear ; echo "VPN ligada" ; echo ; echo "agora, desligue a VPN" ; echo "não sabe desligar VPN?" ; echo "fecha dos recentes" ; echo "forçar parada do App" ; echo ; echo "obedeça" ; sleep 2 ; check1 ;;
    0) clear 
    esac
}
check1
check2() {
    vpn=$(ifconfig | grep -c tun0)
    case $vpn in
    1) clear ; echo "pare a vpn" ; echo "caso precise" ; echo "diversão garantida" ; echo ; echo "tá sentindo a energia?" ; sleep 1 ; check2 ;;
    esac
}
check2
}
clear
Menu
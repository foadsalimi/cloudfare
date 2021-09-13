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
    echo -e " \e[01;36m[  4 ] | \e[0m\e[01;33mX9 para usuários com root\e[0m"
    echo -e " \e[01;36m[  0 ] | \e[0m\e[01;31mSAIR, TENHO MEDO\e[0m"
    echo -e '\n'
    echo -e " \e[00;31m═══════════════════════════════\e[0m"
    echo 
    echo -e " \e[05;35mRaj, escolhe uma carta\e[05m"
    read -n1 -p "$Apps" Apps
    case $Apps in
    1) Proxy;;
    2) IPFree;;
    3) Hosts;;
    4) Sniffer;;
    0) Sair;;
    *) Menu;;
    esac
    }

    Proxy(){
    clear 
    case $Apps in 
    1) git clone https://github.com/leitura/testproxy.git; cd testproxy; chmod +x scan && ./scan ; sleep 2 ; clear ; exit ;;
    esac
}
    IPFree(){
    clear ;
    case $Apps in 
    2) curl -sO https://raw.githubusercontent.com/leitura/ip-free/main/iniciar.sh; chmod +x iniciar.sh && ./iniciar.sh ; sleep 2 ; clear ; exit ;;
    esac
}
    Hosts(){
    clear ; 
    case $Apps in 
    3) git clone https://github.com/leitura/subdomainCDN.git; cd subdomainCDN; chmod +x scan && ./scan ; sleep 2 ; clear ; exit ;;
0) clear ; exit ;;
    esac
}
Sair(){
clear ; 
case $Apps in 
0) clear ; exit ;;
esac
}
Sniffer(){
GREEN='\033[1;32m'
SCOLOR='\033[0m'
clear
check2() {
    vpn=$(ifconfig | grep -c tun0)
    case $vpn in
    1) echo "Pare a VPN antes, cadê seu root?" ; sleep 4 ; Menu;;
    0) clear;;
     esac
}
check2
  read -p "atualizar pacotes básicos? [Y/n] (Y= sim / n= Não " optione
  case $optione in
  y) apt upgrade -y ; apt update -y && apt upgrade root-repo -y && pkg install tcpdump -y ; sleep 3 ; sniff;;
  Y) apt upgrade -y ; apt update -y && apt upgrade root-repo -y && pkg install tcpdump -y ; sleep 3 ; sniff ;;
  n) sniff;;
  N) sniff;;
  *) Menu;;
  esac
  }
sniff(){
clear
su -c rm sniffer.txt
su -c rm proxys.txt
clear

echo -e "${GREEN} Localizar pai em 10 segundos${SCOLOR}" ; echo ; echo "Conecte-se no aplicativo Xing Ling que quer sniffar," ; echo "em seguida, volte aqui para ver a diversão"

Sniff=$(su -c tcpdump -c10 -n -A port 80)
echo -e "$Sniff" >> sniffer.txt

Proxys=$(cat sniffer.txt | grep 104 | cut -d' ' -f5)
echo -e "$Proxys" >> proxys.txt

clear

P1=$(head -c1K sniffer.txt | grep -a HTTP | cut -d' ' -f3 | cut -d'<' -f3)
P2=$(cat sniffer.txt | grep Host)
P3=$(cat sniffer.txt | grep Upgrade)
Proxy=$(cat proxys.txt | grep -n 1 | grep 1: | cut -d':' -f2 | cut -d'.' -f1-4)
Porta=$(cat proxys.txt | grep -n 1 | grep 1: | cut -d':' -f2 | cut -d'.' -f5 | cut -d ":" -f1)


check2() {
    P13=$(cat sniffer.txt | grep -c Upgrade)
    case $P13 in
    0) echo "Pai não encontrado" ; sleep 4 ; Menu;;
    1) clear;;
     esac
}
check2

echo -e "${GREEN}GET / HTTP/1.1${SCOLOR}"
echo -e "${GREEN}$P2${SCOLOR}"
echo -e "${GREEN}$P3${SCOLOR}"
echo 
echo -e "${GREEN}Proxy: $Proxy${SCOLOR}"
echo -e "${GREEN}Porta: $Porta${SCOLOR}"

echo

echo -e "${GREEN}GET / HTTP/1.1[crlf]$P2[crlf]Upgrade: websocket[crlf][crlf]${SCOLOR}"

echo
 read -n1 -p "Se quiser voltar, clique em qualquer tecla" optione1
  case $optione1 in
  *)Menu;;
  esac
}

clear
Menu
    *) echo "calma barboleta" ; sleep 1 ; Menu ;;
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
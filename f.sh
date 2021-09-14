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
    echo -e " ${DESTACAR}[  4 ] | X9 de conexão Websocket Direct"
    echo -e " \e[01;36m[  5 ] | \e[0m\e[01;33mX9 de conexão SSL+Payload\e[0m"
    echo -e " \e[01;36m[  0 ] | \e[0m\e[01;31mSAIR, TENHO MEDO\e[0m"
    echo -e '\n'
    echo -e " \e[00;31m═══════════════════════════════\e[0m"
    echo 
    echo -e " \e[05;35mRaj, escolhe uma carta\e[05m"
    read -n1 -p "$App" App
    case $App in
    1) Proxy;;
    2) IPFree;;
    3) Hosts;;
    4) wsDirect;;
    5) wspayssl;;
    0) Sair;;
    *) Menu;;
    esac
    }

    Proxy(){
    clear 
    case $App in 
    1) git clone https://github.com/leitura/testproxy.git; cd testproxy; chmod +x scan && ./scan ; sleep 2 ; clear ; exit ;;
    esac
}
    IPFree(){
    clear ;
    case $App in 
    2) curl -sO https://raw.githubusercontent.com/leitura/ip-free/main/iniciar.sh; chmod +x iniciar.sh && ./iniciar.sh ; sleep 2 ; clear ; exit ;;
    esac
}
    Hosts(){
    clear ; 
    case $App in 
    3) git clone https://github.com/leitura/subdomainCDN.git; cd subdomainCDN; chmod +x scan && ./scan ; sleep 2 ; clear ; exit ;;
0) clear ; exit ;;
    esac
}
wsDirect(){
GREEN='\033[1;32m'
SCOLOR='\033[0m'
clear
  read -p "atualizar pacotes básicos? y= sim, n= não [Y/n] " optione
  case $optione in
  y) apt upgrade -y ; apt update -y && apt upgrade root-repo -y && pkg install tcpdump -y ; pkg install tsu ; sleep 3 ; sniffer;;
  Y) apt upgrade -y ; apt update -y && apt upgrade root-repo -y && pkg install tcpdump -y ; pkg install tsu ; sleep 3 ; sniffer ;;
  n) sniffer;;
  N) sniffer;;
  *) Menu;;
  esac
  }
sniffer(){
clear
check7() {
    vpn=$(ifconfig | grep -c tun0)
    case $vpn in
    1) echo "Desligue a VPN, cadê seu root? " ; sleep 4 ; Menu;;
    0) clear;;
     esac
}
check7
clear
su -c rm sniffer.txt
su -c rm proxys.txt
clear

echo -e "${GREEN}Localizar pai em 10 segundos${SCOLOR}" ; echo ; echo "Conecte-se" ; echo "e volte aqui para ver a diversão "

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

read -n1 -p "Ver usuário e senha? y= sim, n= não [Y/n] " optione1
  case $optione1 in
  N)Menu;;
  n)Menu;;
  y)login;;
  Y)login;;
  *)Menu;;
  esac
}


login(){
su -c rm login.xml
clear
echo -e "\emCole o nome do pacote do APP${SCOLOR}\em "
read App
echo ""

su -c mv /data/data/$App/shared_prefs/"$App"_preferences.xml login.xml

User=$(su -c cat login.xml | grep USERNAME | cut -d '>' -f2 | cut -d'<' -f1)

Pass=$(su -c cat login.xml | grep PASSWORD | cut -d '>' -f2 | cut -d'<' -f1)

clear

echo -e "${GREEN}GET / HTTP/1.1${SCOLOR}"
echo -e "${GREEN}$P2${SCOLOR}"
echo -e "${GREEN}$P3${SCOLOR}"
echo 
echo -e "${GREEN}Proxy: $Proxy${SCOLOR}"
echo -e "${GREEN}Porta: $Porta${SCOLOR}"
echo
echo -e "${GREEN}Usuário: $User${SCOLOR}"
echo -e "${GREEN}Senha: $Pass${SCOLOR}"
echo
echo -e "${GREEN}GET / HTTP/1.1[crlf]$P2[crlf]Upgrade: websocket[crlf][crlf]${SCOLOR}"
echo

 read -n1 -p "Se quiser voltar, clique em qualquer tecla " optione1
  case $optione1 in
  *)Menu;;
  esac
}



wspayssl(){
clear
GREEN='\033[1;32m'
SCOLOR='\033[0m'
clear
  read -p "atualizar pacotes básicos? y= sim, n= não [Y/n] " optione
  case $optione in
  y) apt upgrade -y ; apt update -y && apt upgrade root-repo -y && pkg install tcpdump -y ; pkg install tsu ; sleep 3 ; sniff;;
  Y) apt upgrade -y ; apt update -y && apt upgrade root-repo -y && pkg install tcpdump -y ; pkg install tsu ; sleep 3 ; sniff ;;
  n) sniff;;
  N) sniff;;
  *) Menu;;
  esac
  }
sniff(){
clear
echo -e "desative a opção ${GREEN}SSL${SCOLOR}, e deixe"
echo -e "apenas ${GREEN} Payload${SCOLOR} ativada e conecte-se "
echo 
read -n1 -p "Reza pra pegar, digite y e dê enter " optione12
  case $optione12 in 
  y)Xaringan;;
  Y)Xaringan;;
   *)sniff;;
  esac
  }


Xaringan(){
clear
su -c rm sniffer.txt
su -c rm proxys.txt
clear

echo -e "${GREEN} Localizar pai em 10 segundos ${SCOLOR}"

echo

su -c tcpdump -i any -n -c25 -w sniffer.txt

Proxys=$(cat sniffer.txt | grep 104 | cut -d' ' -f5)
echo -e "$Proxys" >> proxys.txt

clear

P1=$(head -c1K sniffer.txt | grep -a HTTP | cut -d' ' -f3 | cut -d'<' -f3)
P2=$(cat sniffer.txt | grep -a Host)
P3=$(cat sniffer.txt | grep -a Upgrade)
Proxy=$(cat sniffer.txt | grep -a 104 | cut -d':' -f1 | cut -d' ' -f2)
Porta=$(cat sniffer.txt | grep -a 104 | cut -d':' -f2 | cut -d' ' -f1)
P6=$(cat sniffer.txt | grep -a Host | cut -d' ' -f2)

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
echo -e "${GREEN}SNI: $P6${SCOLOR}"
echo
read -n1 -p "Ver usuário e senha? y= sim, n= não [Y/n] " optione1
  case $optione1 in
  N)Menu;;
  n)Menu;;
  y)login;;
  Y)login;;
  *)Menu;;
  esac
}


login(){
su -c rm login.xml
clear
echo -e "\emCole o nome do pacote do APP${SCOLOR}\em "
read App
echo ""

su -c mv /data/data/$App/shared_prefs/"$App"_preferences.xml login.xml

User=$(su -c cat login.xml | grep USERNAME | cut -d '>' -f2 | cut -d'<' -f1)

Pass=$(su -c cat login.xml | grep PASSWORD | cut -d '>' -f2 | cut -d'<' -f1)

clear

echo -e "${GREEN}GET / HTTP/1.1${SCOLOR}"
echo -e "${GREEN}$P2${SCOLOR}"
echo -e "${GREEN}$P3${SCOLOR}"
echo 
echo -e "${GREEN}Proxy: $Proxy${SCOLOR}"
echo -e "${GREEN}Porta: $Porta${SCOLOR}"
echo
echo -e "${GREEN}Usuário: $User${SCOLOR}"
echo -e "${GREEN}Senha: $Pass${SCOLOR}"
echo
echo -e "${GREEN}SNI: $P6${SCOLOR}"
echo
read -n1 -p "Se quiser voltar, clique em qualquer tecla " optione1
  case $optione1 in
  *) echo "clama barboleta" ; sleep 2 ; Sair;;
  esac
}
clear
Menu
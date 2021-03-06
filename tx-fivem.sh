#!/bin/bash
# Script Auto Install Five M
#=====================================================================================
# Author:   Ma3lich#7006
#=====================================================================================
#=====================================================================================
# Root Force
# By TxHost.fr

cat << "EOF"
       _____    _   _           _   
      |_   _|  | | | |         | |  
        | |_  _| |_| | ___  ___| |_ 
        | \ \/ /  _  |/ _ \/ __| __|
        | |>  <| | | | (_) \__ \ |_ 
        \_/_/\_\_| |_/\___/|___/\__|

     Discord : https://discord.txhost.fr
          Site : https://txhost.fr
            
            TxHost © 2021 - 2022                          
EOF
#Supported systems:
supported="Ubuntu (20.04)"
COLOR1='\033[0;32m'                                         #green color
COLOR2='\033[0;31m'                                         #red color
COLOR3='\33[0;33m'
NC='\033[0m'                                                #no color

 if [ "$(id -u)" != "0" ]; then
         printf "${RED}ERREUR : Tx-FiveM  n'a pas accès root. ⛔️\\n" 1>&2
         printf "\\n"
         exit 1
 fi
    printf "${COLOR1}   ©️ Copyright Tous droits réservés TXHOST ©️ \\n"
    printf "${COLOR2}  💻 Systèmes pris en charge : $supported 💻\\n"
    printf "${NC}\\n"    
    sleep 5
#############################################################################
#Installation prérequis
echo -e "${YELLOW} Instalaltion des prérequis pour un serveur Five M ! \\n"
sleep 1
    apt update
    apt upgrade -y
    apt install bash curl wget nload htop sudo neofetch -y
    wget https://raw.githubusercontent.com/TxHost/assets/main/vps/.bashrc
    source .bashrc
    rm /etc/motd
    cd /etc/
    wget https://raw.githubusercontent.com/TxHost/assets/main/vps/motd

    sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/g' /etc/ssh/sshd_config;systemctl restart ssh
 apt install lsb-release apt-transport-https ca-certificates bash xz-utils git screen -y 
sleep 2

#Installation de 5436

echo -e "${YELLOW} Instalaltion de la dernière version de l'artefact pour serveur Five M  \\n"
sleep 1
echo -e  "${CYAN} Démarrage de l'instalaltion de version de 5436 pour serveur Five M !"
  cd /home/
  mkdir -p fivem
  cd /home/fivem
  wget  https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/5436-1984c3e2a7b968f2772a90920b56473b9995f5e3/fx.tar.xz
  tar xvfJ fx.tar.xz
  sed -i '1irm -r cache' run.sh
  rm fx.tar.xz
sleep 2

#Installation de SYSTEMCTL
echo
    printf "${YELLOW} Vous souhaitez disposer de commandes system pour démarrer votre serveur fivem ❓  [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage technologie pour démarrer votre serveur fivem !"
    cd /etc/systemd/system
    wget https://raw.githubusercontent.com/TxHost/Tx-Fivem/master/fivem.service
    systemctl enable fivem.service
    sleep 2
    cd /usr/bin/
    wget https://raw.githubusercontent.com/TxHost/Tx-FiveM/master/tx-start.sh
    chmod +x tx-start
    cd
fi
sleep 2

# Installation MARIADB
echo
    printf "${YELLOW} Souhaitez-vous créer une installation automatique de MariaDB ❓ [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de l'instalaltion de MariaDB pour serveur FiveM !"
    apt -y install software-properties-common curl apt-transport-https ca-certificates gnupg
    LC_ALL=C.UTF-8 add-apt-repository -y ppa:ondrej/php
    add-apt-repository -y ppa:chris-lea/redis-server
    curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
    apt update -y
    sudo add-apt-repository ppa:ondrej/php
    sudo apt-get update -y
    sudo apt-get install php-mbstring php-gettext
    sudo apt -y install php7.4
    apt install -y php7.4-{cli,gd,mysql,pdo,mbstring,tokenizer,bcmath,xml,fpm,curl,zip} mariadb-client mariadb-server apache2 tar unzip git 
    php -v
fi
sleep 2


echo -n -e "${GREEN} Quel est le nom de votre base de données ❓ ${YELLOW}(tx_base)${reset}: "
read -r DBNAME
if [[ "$DBNAME" == "" ]]; then
  DBNAME="tx_base"  
fi
sleep 2


echo -n -e "${GREEN} Quel est l'utilisateur de votre base de données ❓ ${YELLOW}(txhost)${reset}: "
read -r DBUSER
if [[ "$DBUSER" == "" ]]; then
  DBUSER="txhost"  
fi
sleep 2
echo -n -e "${GREEN} Quel est le mot de passe de votre base de données ❓ ${YELLOW}(txhost) ${reset}: "
read -s -r DBPASS
if [[ "$DBPASS" == "" ]]; then
  DBUSER="txhost"  
fi

#Installation PHPMYADMIN
echo
    printf "${YELLOW} Souhaitez-vous crée une installation automatique de PHPMYADMIN ❓ [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]  
then 
printf "${CYAN} Démarrage de l'instalaltion de PHPMYADMIN !"
    apt install phpmyadmin -y
    sudo service apache2 restart
    ln -s /usr/share/phpmyadmin/ /var/www/html/phpmyadmin
fi

echo -e "${YELLOW} Configuration de la utilisateur"
  echo "Mettre le mot de passe root de MySQL"
  sleep 2
  mysql -e "CREATE USER '${DBUSER}'@'localhost' IDENTIFIED BY '${DBPASS}';"
  mysql -e "CREATE DATABASE ${DBNAME};"
  mysql -p -e "GRANT ALL PRIVILEGES ON * . * TO '${DBUSER}'@'localhost';"
  mysql -e "FLUSH PRIVILEGES;"


  sleep 3

    printf "${COLOR1}✔️ L'installation est terminée ! \\n"
    printf "${COLOR3}❤️ Site de TxHost: https://txhost.fr/ \\n"
    printf "${COLOR3}❤️ Discord de TxHost: https://discord.txhost.fr/ \\n"
    printf "${COLOR3}❤️ Github de TxHost: https://github.com/TxHost/ \\n"
    printf "${NC}\\n" 
    sleep 1
    printf "${COLOR1}✔️ Récapitulatif du MySQL \\n"
    printf "${COLOR4}🌐 Lien du phpMyAdmin : http://$(hostname -I)/phpmyadmin/ \\n"
    printf "${COLOR4}👤 Nom d'utilisateur de la base de données MySQL: ${DBUSER}\\n"
    printf "${COLOR4}👤 Mot de passe de connexion base de données MySQL: ${DBPASS} \\n"
    printf "${NC}\\n" 
    sleep 1
    printf "${COLOR2}✔️ Récapitulatif sur créaction de votre seveur ! \\n"
    printf "${COLOR2}🌐 Lien du TxAdmin : http://$(hostname -I):40120/ \\n"
    printf "${COLOR2}💻 Chemin du dossier  : /home/fivem \\n"
    printf "${COLOR2}⚠️ Ne surtout pas supprime run.sh et alpine\\n"
    printf "${NC}\\n"    

  sleep 10
echo
    printf "${YELLOW} Souhaitez-vous démarrer votre serveur Five M   ❓ [o/N]\\n"
    read reponse
if [[ "$reponse" == "o" ]]
then 
printf "${CYAN} Démarrage de votre serveur Five M !"
    sudo iptables -A INPUT -p tcp --dport 40120 -j ACCEPT  
    sudo netfilter-persistent save
    sudo netfilter-persistent reload
    cd /home/fivem
    wget https://raw.githubusercontent.com/TxHost/assets/main/fivem/server.cfg
    bash /home/fivem/run.sh
fi


cat << "EOF"
       _____    _   _           _   
      |_   _|  | | | |         | |  
        | |_  _| |_| | ___  ___| |_ 
        | \ \/ /  _  |/ _ \/ __| __|
        | |>  <| | | | (_) \__ \ |_ 
        \_/_/\_\_| |_/\___/|___/\__|

     Discord : https://discord.txhost.fr
          Site : https://txhost.fr
            
            TxHost © 2021 - 2022                          
EOF

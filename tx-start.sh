#!/bin/bash

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

    sleep 2 

    cd /home/fivem
    bash /home/fivem/run.sh +exec server.cfg +set txAdminPort 40120
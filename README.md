

# Prérequis :

- Un VPS sous Ubuntu 20.04 (chez http://txhost.fr ou autre)


# Lien de l'installation :
```
bash <(wget -O - 'https://raw.githubusercontent.com/TxHost/Tx-FiveM/master/tx-fivem.sh')

```
## Durée de l'installation 

La durée d'installation sur un VPS TxHost est de 02m:12s

# Start & Restart & Stop & Status votre serveur avec les commandes system !
```
systemctl fivem start = Démarrer

systemctl fivem restart = Redémarrer

systemctl fivem stop = Stoper

systemctl fivem status = Avoir le status du serveur
```


# Vous souhaitre crée un deuxième user ?
```
sudo mysql -u root
CREATE USER 'TON-USER'@'localhost' IDENTIFIED BY 'TON-MOT-DE-PASSE';
GRANT ALL PRIVILEGES ON *.* TO 'TON-USER'@'localhost';
FLUSH PRIVILEGES;
quit
```


## Démarage de votre serveur sans les commandes system !

```
    tx-start
```
ou

```
    cd /home/fivem
    bash /home/fivem/run.sh +exec server.cfg +set txAdminPort 40120
```



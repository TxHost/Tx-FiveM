

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
systemctl tx-fivem start = Démarrer

systemctl tx-fivem restart = Redémarrer

systemctl tx-fivem stop = Stoper

systemctl tx-fivem status = Avoir le status du serveur
```

# Démarage de votre serveur sans les commandes system !

```
tx-start
```
ou

```
cd /home/fivem
bash /home/fivem/run.sh +exec server.cfg +set txAdminPort 40120
```



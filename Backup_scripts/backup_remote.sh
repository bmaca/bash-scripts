## This is a more ideal script to backup your app, database, etc.. directories to a remote server of your choice. 
## Ideally if its a database, I would back it up into multiple remote servers. 
## Just decalre the 3 variables that I called "XXX" in order for the script to work. 
## Back it on up, and enjoy a cold $BEER :)

USER=XXXXX
IP=XXXXXX
KEY='/xxx/xxx/key.pem'

#Back up time

FILENAME=backup-$(date +"%m-%d-%Y").tar.gz
tar -czf - /some/directory  | ssh -i $KEY $USER@$IP "cat > /some/dir/$FILENAME"



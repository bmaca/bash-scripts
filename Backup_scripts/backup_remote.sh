## This is a more ideal script to backup your app, database, etc.. directories to a remote server of your choice. 
## Ideally if its a database, I would back it up into multiple remote servers. 
## You will be prompted to enter your source and destination directory.
##Just enter your source directory that you will like to back up and the destination directory of the##remote server, that you want your back up to sit at. 
## Back it on up, and enjoy a cold $BEER :)

USER=XXXXX
IP=XXXXXX
KEY='/xxx/xxx/key.pem'

#Back up time

read -p "Enter your source directory: " SOURCEDIR
read -p "Enter your destination directory: " DESTDIR

FILENAME=backup-$(date +"%m-%d-%Y").tar.gz
tar -czf - $SOURCEDIR  | ssh -i $KEY $USER@$IP "cat > $DESTDIR/$FILENAME"

if [$? -eq 0]; then
    echo "Backup was successfully created!"
else
    echo "Backup was unsuccessful. Exiting"
    exit 1
fi 



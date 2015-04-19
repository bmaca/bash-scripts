# Require a source and destination directory to be passed to the script:
SOURCEDIR=$1
DESTDIR=$2

if [ $# -ne 2 ] ; then
   printf 'Error:\t Please supply both directories \t\n'
     exit 1
fi

# Make sure source and destination directories exist before continuing.

if [ ! -d $SOURCEDIR ] ; then
   printf 'Error:\t Source Directory does not exist, exiting \t\n'
     exit 1

elif [ ! -d $DESTDIR ] ; then
   printf 'Error:\ Destination Directory does not exists, exiting \t\n'
     exit 2
fi


FILENAME=backup-$(date +"%m-%d-%Y").tar.gz
#execute the backup
tar -czf $DESTDIR$FILENAME $SOURCEDIR

if [ $? -eq 0 ] ; then
  echo 'Directory cloning successful'
else
  echo 'Command unsucessful. Exiting.'
    exit 1
fi

exit 0

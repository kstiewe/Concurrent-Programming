#!/bin/bash
SERVERQUEUE_FILEPATH="/home/$1/serwerfifo"
CLIENTQUEUE_FILEPATH="$HOME/klientfifo"

if [ -e $CLIENTQUEUE_FILEPATH ]; then
    rm $CLIENTQUEUE_FILEPATH
fi

mkfifo $CLIENTQUEUE_FILEPATH
chmod 777 $CLIENTQUEUE_FILEPATH

echo $CLIENTQUEUE_FILEPATH $2 > $SERVERQUEUE_FILEPATH
read SERVERQUEUE_READ < $CLIENTQUEUE_FILEPATH
rm $CLIENTQUEUE_FILEPATH
echo $SERVERQUEUE_READ
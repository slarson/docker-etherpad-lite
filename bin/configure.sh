#!/bin/bash

SETTINGS_TEMPLATE=/src/bin/generate-settings.sh
SETTINGS_FILE=/data/etherpad-settings.json
SETTINGS_TARGET=/src/etherpad/settings.json
SETTINGS_DETAILS=/data/etherpad-settings-environment.sh

PATH_APIKEY=/src/etherpad/APIKEY.txt

# Initializing the environment
if [ ! -f $SETTINGS_DETAILS ]
    then
    echo "This is your new environment:"
    PORT=10001

    KEY_SESSION=`node -p "require('crypto').randomBytes(32).toString('hex')"`
    KEY_ROOT=`node -p "require('crypto').randomBytes(16).toString('hex')"`

    TEXT_TITLE="Ecobytes Etherpad"
    TEXT_DEFAULT=""

    PATH_DB=/data/etherpad.db
    PATH_LOGS=/data/etherpad.log
    PATH_FAVICON=/src/bin/favicon.png

    APIKEY=`node apikey.js`

    printf "export PORT=$PORT\n\
    export KEY_SESSION=$KEY_SESSION\n\
    export KEY_ROOT=$KEY_ROOT\n\
    \n\
    export TEXT_TITLE=''$TEXT_TITLE'\n\
    export TEXT_DEFAULT='$TEXT_DEFAULT'\n\
    \n\
    export PATH_DB=$PATH_DB\n\
    export PATH_LOGS=$PATH_LOGS\n\
    export PATH_FAVICON=$PATH_FAVICON\n\
    \n\
    export APIKEY=$APIKEY
    " > $SETTINGS_DETAILS
    source $SETTINGS_DETAILS

else
    echo "This is your old environment:"
    source $SETTINGS_DETAILS
    echo "APIKEY restored"
    printf "${APIKEY}" > $PATH_APIKEY
fi
cat $SETTINGS_DETAILS

if [ ! -f $PATH_APIKEY ]
    then
    echo "Restoring APIKEY"
    printf "${APIKEY}" > $PATH_APIKEY
fi

# Check if the settings have to be created
if [ ! -f $SETTINGS_FILE ]
    then
    echo "Generating new settings file ${SETTINGS_FILE}"
    bash $SETTINGS_TEMPLATE > $SETTINGS_FILE
fi

# Copy setting into the root of the installation, seems to be
# required due to Settings.js
cp -f $SETTINGS_FILE $SETTINGS_TARGET

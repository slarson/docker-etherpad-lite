#!/bin/bash

service mysql start
./configure.sh
cd ../etherpad
pm2 start node_modules/ep_etherpad-lite/node/server.js --no-daemon

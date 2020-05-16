#!/bin/bash

sudo apt-get -y upgrade && sudo apt-get -y update
sudo apt install -y python3-pip git curl python ffmpeg screen
pip3 install flask
cd ~ && wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
unzip ngrok-stable-linux-amd64.zip
rm ngrok-stable-linux-amd64.zip
sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
cd ~/Documents && git clone https://github.com/u9g/auto-dl-twitch.git
cd ~/Documents/auto-dl-twitch
echo screen -dmS webserver python3 ~/Documents/auto-dl-twitch/app.py > startWebserver.sh && chmod +x startWebserver.sh
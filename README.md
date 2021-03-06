﻿# auto-dl-twitch
*I made this guide for windows only (for now), I'll make a linux and docker guide soon.*
# Getting Setup
1. Downloading files necessary
- Download VMware Workstation Player [here](https://my.vmware.com/en/web/vmware/free#desktop_end_user_computing/vmware_workstation_player/15_0)
- Download Ubuntu ISO [here](https://ubuntu.com/download/desktop/thank-you?version=20.04&architecture=amd64)
2. Install VMware Workstation Player
3. Get a twitch account ready that is following the people's streams that you'd like to download
4. Make a new virtual machine in VMware player, just use all defaults, but at the end, click customize hardware and give it 4 GB of ram and ~ 2 - 4 cores
5. After it's been created, under home, right click on the vm you just created and click settings, then click options, shared folder, and click click always enabled, and click add, to add a path to the folder that you'd like to store the streams in host path and then under name put exactly "streams" without quotes, then click next, and click make sure enable this share is checked and click finish
6. Set up the vm like a normal ubuntu vm and vmware tools
7. Once installed, run the following commands
- `sudo apt-get upgrade && sudo apt-get update`
- `sudo apt install python3-pip git curl python ffmpeg screen`
- `pip3 install flask`
- `cd ~ && wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip`
- `unzip ngrok-stable-linux-amd64.zip`
- `rm ngrok-stable-linux-amd64.zip`
- `sudo wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl`
- `sudo chmod a+rx /usr/local/bin/youtube-dl`
- `cd ~/Documents && git clone https://github.com/u9g/auto-dl-twitch.git`
- `cd ~/Documents/auto-dl-twitch`
- `echo screen -dmS webserver python3 ~/Documents/auto-dl-twitch/app.py > startWebserver.sh && chmod +x startWebserver.sh`
8. Run the command `cd ~` Make an account at ngrok [here](https://ngrok.com/) then go to [here](https://dashboard.ngrok.com/get-started/setup) and copy the command from step 2 on the page and run it
9. Run the command `~/ngrok http 5000`
10. Take the URL from where the arrow is pointing and copy it for later ![xeample image](https://i.imgur.com/BSJ156B.png)
11. Make an account at IFTTT [here](https://ifttt.com/)
- Click on the button next to the explore button on the top right
- Click Create
- Click the + button next to the text that says THIS
- Search for twitch
- Click twitch
- Click Connect
- Connect your twitch account
- Click "Stream goes live for a channel you follow"
- For which channel, pick either the channel you'd like to download or click any for any channel you follow that goes live
- Click Create trigger
- Click the + button next to the text that says THAT
- Search for webhook
- Click webhook
- Click connect
- Click "Make a web Request"
- For URL, enter the url we saved earlier with "/ifttt" added to the end without quotes, so if the url you copied was abc.xyz then you would put the url abc.xyz/ifttt
- For method, select the type "POST"
- For content-type, select text/plain
- For body, click "Add Ingredient"
- Click ChannelName
- Then click create action
12. Now click the new tab button where the arrow is pointing and run the command `~/Documents/auto-dl-twitch/startWebserver.sh`![enter image description here](https://i.imgur.com/0kQNKpG.png)
13. Now you should be all ready to download anything that comes your way, until you reboot or lose internet connection
# Starting up after reboots
1. Run the command `~/ngrok http 5000`
2. Save the url for later that is show with the red arrow ![enter image description here](https://i.imgur.com/BSJ156B.png)
3. Go to ifttt [here](https://ifttt.com/my_applets)
4. Click on the purple one
5. Click on settings
6. Scroll down to url
7. For URL, enter the url we saved earlier with "/ifttt" added to the end without quotes, so if the url you copied was abc.xyz then you would put the url abc.xyz/ifttt
8. Click save at the bottom
9. Back to the command line, enter the command `~/Documents/auto-dl-twitch/startWebserver.sh`

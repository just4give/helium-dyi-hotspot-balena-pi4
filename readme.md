## Build your own helium hotspot ( miner + packet forwader ) on Raspberry pi 4 using BalenaOS

![IMG_3112](https://user-images.githubusercontent.com/9275193/88193050-37bc1100-cc0b-11ea-83ff-171d61f1edb3.jpg)
![IMG_3115](https://user-images.githubusercontent.com/9275193/88193059-3985d480-cc0b-11ea-8178-a88d002fa1aa.jpg)


#### Hardwares you need
- Raspberry Pi 4 [link](https://www.amazon.com/gp/product/B07TC2BK1X)
- USBC power adapter [link](https://www.amazon.com/gp/product/B07TYQRXTK)
- 64GB Micro SD card [link](https://www.amazon.com/gp/product/B07NY4L4VZ)
- RAK2245 Pi HAT [link](https://www.amazon.com/gp/product/B085W5ZL4F) While purchasing please check frequency of your country.

#### Sowftwares you need
- Free Balena Cloud account [link](https://dashboard.balena-cloud.com/login)
- Mac or Windows ( I tested on Windows10 ) 
- BalenaEtcher to flash image [download](https://www.balena.io/etcher/)
- Balena CLI  [install](https://github.com/balena-io/balena-cli/blob/master/INSTALL.md)
- jq [install](https://stedolan.github.io/jq/download/)

## Deploy with Balena Button
[![](https://www.balena.io/deploy.png)](https://dashboard.balena-cloud.com/deploy)

## Let's get started 
As you got your hardwares and softwares let's get started and turn your Pi into a helium hotspot 

##### Step 1: Prepare image with balenaOS
Log into balena cloud website and click on "Create Application" button 

<img width="628" alt="Screen Shot 2020-07-22 at 11 06 14 AM" src="https://user-images.githubusercontent.com/9275193/88193208-64702880-cc0b-11ea-8378-14653bb766ba.png">
This wil bring a modal window as below. Type a name as you desire, choose device type as "Raspberry Pi 4" , application type as "Starter" and hit "Create new application" button.
<img width="715" alt="Screen Shot 2020-07-22 at 11 09 00 AM" src="https://user-images.githubusercontent.com/9275193/88193522-c3ce3880-cc0b-11ea-913a-39b6214a310a.png">

Once the application is created, it will take you to the application page. You need to add a device now. 
<img width="717" alt="Screen Shot 2020-07-22 at 11 12 22 AM" src="https://user-images.githubusercontent.com/9275193/88193952-3b9c6300-cc0c-11ea-88e1-6f209b1cee30.png">

Click on "Add device" button which will open below modal. 
<img width="931" alt="Screen Shot 2020-07-22 at 11 14 44 AM" src="https://user-images.githubusercontent.com/9275193/88194295-a9488f00-cc0c-11ea-95df-1a5d50ccf483.png">
Turn on "Wifi+Ethernet" and put your wifi credential there. After that click on "Download BalenaOS" button which will download a zip file on your comuter.
Next, click on Environment variable menu from left pane and create a new variable as "REGION" with value "US915" (you may need to change as per your region. This repo supports US915 and EU868. Please create PR if with your region) 
<img width="1170" alt="Screen Shot 2020-07-22 at 11 19 30 AM" src="https://user-images.githubusercontent.com/9275193/88194802-3ab80100-cc0d-11ea-96ba-7f158328da04.png">

##### Step 2: Flash image on SD card
Plug micro SD card into your computer. Open balenaEtcher software, select the downloaded zip file from your computer and select the SD card to format and click on "Flash" 

<img width="794" alt="Screen Shot 2020-07-22 at 11 26 22 AM" src="https://user-images.githubusercontent.com/9275193/88195598-37714500-cc0e-11ea-9d8e-84e89dbe65e0.png">

Once completed, unplug SD card from your computer and insert in your Raspberry Pi and power up your Pi. In about 20-30 seconds your device should appear on balena cloud application as below.

<img width="1021" alt="Screen Shot 2020-07-22 at 11 34 12 AM" src="https://user-images.githubusercontent.com/9275193/88196518-486e8600-cc0f-11ea-9179-933ccc66e602.png">

Very exciting so far! Isn't is? 

##### Step 3: Deploy helium miner and gateway to balena

Now the fun begins. Stack your RAK2245 HAT on your Pi. From balena cloud , generate a session token ( Preferences -> Access Tokens ) 

Next, clone this repo somewhere on your computer

```
git clone https://github.com/just4give/helium-dyi-hotspot-balena-pi4  && cd helium-dyi-hotspot-balena-pi4
```

Next log into balena cli

```
balena login
```

Choose "Web Authorization" from the list.You will be redirected to a webpage . Press authorize. You can close the window and come back to the console. You should receive successful login message there.

<img width="936" alt="Screen Shot 2020-07-22 at 11 45 08 AM" src="https://user-images.githubusercontent.com/9275193/88197982-31c92e80-cc11-11ea-9e76-dd0143b07778.png">


Next, issue below commands one by one

```
chmod +x build.sh
sh build.sh
balena push helium_diy_hotspot_pi4
```
Please note - the command is balena push <application_name>. If you have used different name in step 1, then use that. 

If everything goes fine, you will see a nice unicorn :) 

<img width="814" alt="Screen Shot 2020-07-22 at 11 54 55 AM" src="https://user-images.githubusercontent.com/9275193/88198879-2d514580-cc12-11ea-9a84-7b7e97f0eb4d.png">

And in few minutes, both gateway and miner will be distrubuted to your device. You should see some logs like. Now if you have a LoRa node, test it out.  

```
22.07.20 12:05:36 (-0400)  gateway  INFO: [up] PUSH_ACK received in 0 ms
22.07.20 12:05:40 (-0400)  gateway  INFO: [down] PULL_ACK received in 0 ms
```

<img width="1387" alt="Screen Shot 2020-07-22 at 12 04 04 PM" src="https://user-images.githubusercontent.com/9275193/88199960-75bd3300-cc13-11ea-9b8d-a62f9551d183.png">

#### Troubleshooting
- If you are not on Mac, you may see some issue running `build.sh` file. If so , remove `''` from `sed` command. 
- If you are on Windows and are unable to build the run the bash script 'build.sh':
    - First check the sed version using the command ``` sed --version ```
    - If GNU sed version 3.02 is the version installed it wont support the -i option for sed, so update to the latest version of sed and try running it.
    - Or replace the contents of the 'build.sh' file with the following one:
    ``` #!/bin/bash

    cp docker-compose-template.yml docker-compose.yml 
    export MINER_TAG=$(curl -s 'https://quay.io/api/v1/repository/team-helium/miner/tag/?limit=100&page=1&onlyActiveTags=true' | jq -c '[ .tags[] | select( .namecontains("arm")) ][0].name' | cut -d'"' -f2)
    sed.exe s/MINER_TAG/$MINER_TAG/g docker-compose.yml > docker-temp.yml
    cp docker-temp.yml docker-compose.yml
    ```



## Special Thanks
I like to thank Marc from Balena and [PastaGringo](https://github.com/PastaGringo). They are the creators of the multi conatiner docker images which I reused. 








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
- Mac or Windows ( I tested on Mac ) 
- BalenaEtcher to flash image [download](https://www.balena.io/etcher/)

#### Let's get started 
As you got your hardwares and softwares let's get started and turn your Pi into a helium hotspot 

##### Step 1: Prepare image with balenaOS
Log into balena cloud website and click on "Create Application" button 

<img width="628" alt="Screen Shot 2020-07-22 at 11 06 14 AM" src="https://user-images.githubusercontent.com/9275193/88193208-64702880-cc0b-11ea-8378-14653bb766ba.png">
This wil bring a modal window as below. Type a name as you desire, choose device type as "Raspberry Pi 4" , application type as "Starter" and hit "Create new application" button.
<img width="715" alt="Screen Shot 2020-07-22 at 11 09 00 AM" src="https://user-images.githubusercontent.com/9275193/88193522-c3ce3880-cc0b-11ea-913a-39b6214a310a.png">




Name      	  	   | Value  
------------------|--------------------------  
REGION            | US915, EU868. Default US915
MINER_IP          | Your own miner IP. Default localhost


<img width="902" alt="Screen Shot 2020-07-20 at 11 16 24 AM" src="https://user-images.githubusercontent.com/9275193/87955025-2b08b300-ca7b-11ea-8cf8-f0d619b416b7.png">


#!/bin/bash

echo "****** GATEWAY SHELL ******"
echo $REGION   $MINER_IP

cd /build
python3 run.py


#cat /build/packet_forwarder/lora_pkt_fwd/global_conf.json
#cat /build/lora_gateway/libloragw/src/loragw_spi.native.c
#raspi-config nonint get_spi
#ls /dev

# Reset RAK2245 PIN
SX1301_RESET_BCM_PIN=17
echo "$SX1301_RESET_BCM_PIN"  |sudo tee /sys/class/gpio/export
echo "out" |sudo tee /sys/class/gpio/gpio$SX1301_RESET_BCM_PIN/direction
echo "0"   |sudo tee /sys/class/gpio/gpio$SX1301_RESET_BCM_PIN/value
sleep 0.1
echo "1"   |sudo tee /sys/class/gpio/gpio$SX1301_RESET_BCM_PIN/value
sleep 0.1
echo "0"   |sudo tee /sys/class/gpio/gpio$SX1301_RESET_BCM_PIN/value
sleep 0.1
echo "$SX1301_RESET_BCM_PIN" |sudo tee /sys/class/gpio/unexport
sleep 0.2

cd /build/packet_forwarder/lora_pkt_fwd
./lora_pkt_fwd


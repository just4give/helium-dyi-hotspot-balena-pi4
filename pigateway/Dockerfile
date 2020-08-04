FROM raspbian/stretch as builder

#RUN apt-get update && apt-get upgrade -y
RUN apt-get update
RUN apt-get install -y git build-essential wget python3

WORKDIR /build
RUN git clone https://github.com/Lora-net/lora_gateway.git
COPY loragw_spi.native.c /build/lora_gateway/libloragw/src

WORKDIR /build
RUN git clone https://github.com/Lora-net/packet_forwarder.git
COPY lora_pkt_fwd.c /build/packet_forwarder/lora_pkt_fwd/src
COPY run.py ./
COPY global_conf_US915.json ./
COPY global_conf_EU868.json ./
COPY global_conf_IN865.json ./


WORKDIR /build/packet_forwarder
RUN ./compile.sh

RUN /build/lora_gateway/reset_lgw.sh start 17


COPY start.sh .
RUN chmod +x start.sh

ENTRYPOINT ["./start.sh"]

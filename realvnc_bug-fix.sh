#!/bin/bash

echo Download and install dependencies
files=( libmmal.so libmmal_core.so libmmal_components.so libmmal_util.so libmmal_vc_client.so libvcsm.so libcontainers.so )
for i in "${files[@]}"
do
        #wget -nv https://github.com/raspberrypi/firmware/raw/master/opt/vc/lib/$i -O /usr/lib/arm-linux-gnueabihf/$i
        wget -nv https://github.com/verzeletti/raspberrypi/raw/main/firmware/$i -O /usr/lib/arm-linux-gnueabihf/$i
done

#!/bin/bash

# Script File Download
#wget -nv https://github.com/verzeletti/raspberrypi/raw/main/realvnc_bug-fix.sh

echo "Logging with root";
sudo su -

# error while loading shared libraries: libbcm_host.so: cannot open shared object file
echo "Update and install packages";
apt-get update
apt-get install --reinstall libraspberrypi0 libraspberrypi-dev libraspberrypi-doc libraspberrypi-bin

# error while loading shared libraries: /lib/arm-linux-gnueabihf/libmmal.so: file too short
echo "Download and install dependencies";
files=( libmmal.so libmmal_core.so libmmal_components.so libmmal_util.so libmmal_vc_client.so libvcsm.so libcontainers.so )
for i in "${files[@]}"
do
        #wget -nv https://github.com/raspberrypi/firmware/raw/master/opt/vc/lib/$i -O /usr/lib/arm-linux-gnueabihf/$i
        wget -nv https://github.com/verzeletti/raspberrypi/raw/main/firmware/$i -O /usr/lib/arm-linux-gnueabihf/$i
done

echo "Restarting services";
systemctl restart vncserver-x11-serviced.service; systemctl status vncserver-x11-serviced.service

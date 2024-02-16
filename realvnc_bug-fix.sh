#!/bin/bash

# Download script file and execute
# wget -nv https://github.com/verzeletti/raspberrypi/raw/main/realvnc_bug-fix.sh && bash realvnc_bug-fix.sh

# error while loading shared libraries: libbcm_host.so: cannot open shared object file
echo "";
echo "Update and install packages";
sudo apt-get update
sudo apt-get -y install --reinstall libraspberrypi0 libraspberrypi-dev libraspberrypi-doc libraspberrypi-bin

# error while loading shared libraries: /lib/arm-linux-gnueabihf/libmmal.so: file too short
echo "";
echo "Download and install dependencies";
files=( libmmal.so libmmal_core.so libmmal_components.so libmmal_util.so libmmal_vc_client.so libvcsm.so libcontainers.so )
for i in "${files[@]}"
do
        #wget -nv https://github.com/raspberrypi/firmware/raw/master/opt/vc/lib/$i -O /usr/lib/arm-linux-gnueabihf/$i
        sudo wget -nv https://github.com/verzeletti/raspberrypi/raw/main/firmware/$i -O /usr/lib/arm-linux-gnueabihf/$i
done

echo "";
echo "Restarting services";
sudo systemctl restart vncserver-x11-serviced.service; sudo systemctl status vncserver-x11-serviced.service

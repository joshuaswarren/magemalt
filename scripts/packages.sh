apt-get clean
apt-get update
apt-get upgrade -y
apt-get install -y linux-generic linux-headers-generic linux-headers-server linux-image-generic linux-server
apt-get install -y lynx-cur

# Reboot with the new kernel so we can build the proper guest additions
shutdown -r now
sleep 60

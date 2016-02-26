# Install the Linux headers
apt-get -y install build-essential linux-headers-$(uname -r)

# Install the VMware Fusion guest tools
cd /tmp
mkdir -p /mnt/cdrom
mount -o loop ~/linux.iso /mnt/cdrom
tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
/tmp/vmware-tools-distrib/vmware-install.pl -d --force-install
rm /home/vagrant/linux.iso
umount /mnt/cdrom

echo "answer AUTO_KMODS_ENABLED yes" >> /etc/vmware-tools/locations

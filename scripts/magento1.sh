cd /usr/local/src/

bash < <(wget -q --no-check-certificate -O - https://raw.github.com/colinmollenhour/modman/master/modman-installer)
cp /home/vagrant/bin/modman /usr/local/bin/modman
chmod a+rx /usr/local/bin/modman

git clone https://github.com/OpenMage/magento-mirror magento1

cd ..

mkdir /opt/magento1
cd /opt/magento1

magerun install --dbHost="localhost" --dbUser="dev" --dbPass="dev" --dbName="magento" --installSampleData=yes --useDefaultConfigParams=yes --magentoVersionByName="magento-mirror-1.9.2.3" --installationFolder="/opt/magento1" --baseUrl="http://192.168.33.10/magento1/"


# required for PHP 7 compatability
modman init
modman clone https://github.com/Inchoo/Inchoo_PHP7
magerun cache:flush
magerun sys:setup:run

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "*/1 * * * * /usr/bin/php -c /etc/php5/apache2/php.ini /var/www/magento1/cron.php > /var/www/magento1/var/log/magento.cron.log&" >> mycron
#install new cron file
crontab mycron
rm mycron

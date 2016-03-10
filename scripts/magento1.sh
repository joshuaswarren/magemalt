cd /usr/local/src/

git clone https://github.com/OpenMage/magento-mirror magento1

cd ..

mkdir /opt/magento1
cd /opt/magento1

magerun install --dbHost="localhost" --dbUser="dev" --dbPass="dev" --dbName="magento" --installSampleData=yes --useDefaultConfigParams=yes --magentoVersionByName="magento-mirror-1.9.2.3" --installationFolder="/opt/magento1" --baseUrl="http://192.168.33.10/magento1/"

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "*/1 * * * * /usr/bin/php -c /etc/php5/apache2/php.ini /var/www/magento1/cron.php > /var/www/magento1/var/log/magento.cron.log&" >> mycron
#install new cron file
crontab mycron
rm mycron

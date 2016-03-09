mkdir /var/www/public/
cd /var/www/public/

mkdir cleancopies

git clone https://github.com/OpenMage/magento-mirror magento1

cd ..

mkdir magento
cd magento

magerun install --dbHost="localhost" --dbUser="dev" --dbPass="dev" --dbName="magento" --installSampleData=yes --useDefaultConfigParams=yes --magentoVersionByName="magento-mirror-1.9.2.3" --installationFolder="magento" --baseUrl="http://192.168.33.10/magento/"

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo << EOF
*/1 * * * * /usr/bin/php -c /etc/php5/apache2/php.ini /var/www/public/magento/cron.php > /var/www/public/magento/var/log/magento.cron.log&
EOF >> mycron
#install new cron file
crontab mycron
rm mycron

cd /usr/local/src/

git clone https://github.com/magento/magento2
git clone https://github.com/magento/magento2-sample-data

cp -r /usr/local/src/magento2 /opt/magento2
cp -r /usr/local/src/magento2-sample-data /opt/magento2-sample-data

cd /opt/
php -f magento2-sample-data/dev/tools/build-sample-data.php -- --ce-source="/opt/magento2"

cd /opt/magento2
composer install

cd /opt/magento2 

chmod a+x bin/magento

bin/magento setup:install --admin-firstname=Admin --admin-lastname=User --admin-email=test@test.com --admin-user=admin --admin-password=password1 --base-url=http://192.168.33.10/magento2/ --backend-frontname=adminpanel --db-host=localhost --db-name=magento2 --db-user=dev --db-password=dev --currency=USD --language=en_US --timezone=America/Chicago --use-rewrites=1

# chmod -R 777 * 

bin/magento setup:db-data:upgrade 
bin/magento setup:upgrade
bin/magento setup:di:compile
bin/magento sampledata:deploy
bin/magento setup:static-content:deploy
bin/magento deploy:mode:set developer
bin/magento setup:upgrade

mkdir -p /pub/media/catalog/product/cache/1/

# chmod -R 777 *

# setup Magento 2 crontab

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
echo "*/1 * * * * /usr/bin/php -c /etc/php5/apache2/php.ini /var/www/public/magento2/bin/magento cron:run > /var/www/public/magento2/var/log/magento.cron.log&" >> mycron
echo "*/1 * * * * /usr/bin/php -c /etc/php5/apache2/php.ini /var/www/public/magento2/update/cron.php > /var/www/public/magento2/var/log/update.cron.log&" >> mycron
echo "*/1 * * * * /usr/bin/php -c /etc/php5/apache2/php.ini /var/www/public/magento2/bin/magento setup:cron:run > /var/www/public/magento2/var/log/setup.cron.log&" >> mycron
#install new cron file
crontab mycron
rm mycron

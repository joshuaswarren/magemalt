cd /var/www/public/

mkdir cleancopies

cd cleancopies

git clone https://github.com/magento/magento2
git clone https://github.com/magento/magento2-sample-data

cp -r magento2 ..
cp -r magento2-sample-data ..

cd ..
php -f magento2-sample-data/dev/tools/build-sample-data.php -- --ce-source="magento2"

cd magento2
composer install

cd .. 

magento2/bin/magento setup:install --admin-firstname=Admin --admin-lastname=User --admin-email=test@test.com --admin-user=admin --admin-password=password --base-url=http://192.168.33.10/magento2/ --backend-frontname=adminpanel --db-host=localhost --db-name=magento2 --db-user=dev --db-password=dev --currency=USD --language=en_US --timezone=America/Chicago --use-rewrites=1

magento2/bin/magento setup:di:compile

# setup Magento 2 crontab

#write out current crontab
crontab -l > mycron
#echo new cron into cron file
cat << EOC >> mycron
*/1 * * * * /usr/bin/php -c /etc/php5/apache2/php.ini /var/www/public/magento2/bin/magento cron:run > /var/www/public/magento2/var/log/magento.cron.log&
*/1 * * * * /usr/bin/php -c /etc/php5/apache2/php.ini /var/www/public/magento2/update/cron.php > /var/www/public/magento2/var/log/update.cron.log&
*/1 * * * * /usr/bin/php -c /etc/php5/apache2/php.ini /var/www/public/magento2/bin/magento setup:cron:run > /var/www/public/magento2/var/log/setup.cron.log&
EOC 
#install new cron file
crontab mycron
rm mycron

cd /usr/local/src/

git clone https://github.com/magento/magento2 magento2-github-develop
git clone https://github.com/magento/magento2-sample-data magento2-sample-data-github-develop

chown -R vagrant:www-data /usr/local/src/magento2-github-develop
chown -R vagrant:www-data /usr/local/src/magento2-sample-data-github-develop

composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition /opt/magento2

chown -R vagrant:www-data /opt/magento2

cd /opt/magento2
composer install

cd /opt/magento2 

chmod a+x bin/magento

bin/magento setup:install --admin-firstname=Admin --admin-lastname=User --admin-email=test@test.com --admin-user=admin --admin-password=password1 --base-url=http://192.168.33.10/magento2/ --backend-frontname=adminpanel --db-host=localhost --db-name=magento2 --db-user=dev --db-password=dev --currency=USD --language=en_US --timezone=America/Chicago --use-rewrites=1

cat <<EOTA2 >> /var/www/public/magento2/var/composer_home/auth.json
{
    "http-basic": {
        "repo.magento.com": {
            "username": "9c0013c46255fb5c0cf01c391072db5f",
            "password": "cc28fe657d093c1695c34708bc004c1a"
        }
    }
}
EOTA2

composer update
bin/magento setup:db-data:upgrade 
bin/magento setup:upgrade
bin/magento setup:di:compile
bin/magento sampledata:deploy
bin/magento setup:static-content:deploy
bin/magento deploy:mode:set developer
bin/magento setup:upgrade

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

chmod -R a+rw /opt/magento2

rm -rf /var/www/public/magento2/var/generation
rm -rf /var/www/public/magento2/var/cache
rm -rf /opt/magento2/var/generation
rm -rf /opt/magento2/var/cache

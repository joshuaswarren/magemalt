rm /home/vagrant/magemalt_version.txt
echo "2.0.8" >> /home/vagrant/magemalt_version.txt

mkdir /home/vagrant/.composer
cat <<EOT >> /home/vagrant/.composer/composer.json
{
    "require": {
        "laravel/installer": "~1.1",
        "laravel/envoy": "~1.0",
        "phpunit/phpunit": "^5.0",
        "phpunit/dbunit": "^2.0",
        "phing/phing": "^2.12",
        "phpdocumentor/phpdocumentor": "^2.8",
        "sebastian/phpcpd": "^2.0",
        "phploc/phploc": "^2.1",
        "phpmd/phpmd": "^2.3",
        "squizlabs/php_codesniffer": "^2.3",
        "phpspec/phpspec": "^2.3",
        "Behat/Behat": "^3.0"
    }
}
EOT

cat <<EOT2 >> /home/vagrant/.composer/config.json
{
    "config": {
        "cache-files-maxsize": "2048MiB",
        "process-timeout": 2000
     }
}
EOT2

mkdir /root/.composer

cat <<EOT3 >> /root/.composer/config.json
{
    "config": {
        "cache-files-maxsize": "2048MiB",
        "process-timeout": 2000
    }
}
EOT3

cat <<EOT4 >> /root/preseed.txt
locales locales/locales_to_be_generated multiselect     en_US.UTF-8 UTF-8
locales locales/default_environment_locale      select  en_US.UTF-8
phpmyadmin	phpmyadmin/reconfigure-webserver	multiselect	apache2
EOT4

apt-get install -y debconf-utils
debconf-set-selections /root/preseed.txt

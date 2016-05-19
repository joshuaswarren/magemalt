export DEBIAN_FRONTEND=noninteractive DEBCONF_NONINTERACTIVE_SEEN=true

# Install some system packages
apt-get install -y wget curl vim git mercurial bzr tree python python-pip htop nmap

# Install ifs
pip install -U setuptools pip
pip install ifs

# Install hostess
wget -q https://github.com/cbednarski/hostess/releases/download/v0.1.0/hostess_linux_amd64
chmod +x hostess_linux_amd64
mv hostess_linux_amd64 /usr/local/bin/hostess

apt-get install -y --force-yes python-software-properties software-properties-common
add-apt-repository -y ppa:ondrej/php5-5.6
add-apt-repository -y ppa:brightbox/ruby-ng
add-apt-repository -y ppa:ondrej/php
apt-get update
apt-get install -y --force-yes php7.0 php7.0-mysql php7.0-fpm php7.0-cli php7.0-xsl php7.0-intl php7.0-mcrypt php7.0-curl php7.0-gd php7.0-mbstring php7.0-zip
apt-get install -y --force-yes git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
apt-get install -y --force-yes ruby2.2 ruby2.2-dev
apt-get install -y --force-yes libgd-tools
apt-get install -y --force-yes ant
apt-get install -y --force-yes php-gettext

apt-get install -y ruby-sass ruby-compass

gem install compass

apt-get install -y libapache2-mod-php7.0 apache2-utils links

a2enmod rewrite
service apache2 restart

# required for Zray installer to work
ln -s /var/www /var/www/html

wget https://getcomposer.org/installer
php installer
rm installer
mv composer.phar /usr/local/bin/composer

composer config --global process-timeout 2000

apt-get install -y beanstalkd
apt-get install -y nodejs
apt-get install -y npm
apt-get install -y php5-mcrypt
apt-get install -y php5-curl

apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
add-apt-repository 'deb http://download.nus.edu.sg/mirror/mariadb/repo/10.0/ubuntu trusty main'
apt-get update

apt-get install -y --force-yes mariadb-server mariadb-client libclone-perl libmldbm-perl libnet-daemon-perl libplrpc-perl libsql-statement-perl libipc-sharedcache-perl tinyca

apt-get install -y adminer phpmyadmin

apt-get install -y postgresql-9.3

apt-get install -y sqlite php5-sqlite libsqlite3-dev

apt-get install -y php5-redis

apt-get install -y php5-memcache php5-memcached php5-apcu

apt-get install -y vim grep sed awk sort seq watch curl tree wget

npm update

npm install grunt
npm install bower
npm install yeoman
npm install gulp
npm install browser-sync
npm install pm2

npm update

gem install mailcatcher

composer global update
composer gloal require magento/magento2ce

wget -O zray.tar.gz http://www.zend.com/en/download/3973?start=true
tar -zxvf zray.tar.gz
ZRay-Installer/install.sh

wget -O - https://packagecloud.io/gpg.key | sudo apt-key add -
echo "deb http://packages.blackfire.io/debian any main" | sudo tee /etc/apt/sources.list.d/blackfire.list
apt-get update

apt-get install -y blackfire-agent blackfire-php

cd /usr/local/bin
wget http://files.magerun.net/n98-magerun-latest.phar
chmod +x ./n98-magerun-latest.phar
mv n98-magerun-latest.phar magerun

cd /usr/local/bin
wget http://files.magerun.net/n98-magerun2.phar
chmod +x ./n98-magerun2.phar	
mv n98-magerun2.phar magerun2

easy_install behave 

mkdir /opt/selenium
cd /opt/selenium
wget http://selenium-release.storage.googleapis.com/2.44/selenium-server-standalone-2.44.0.jar
apt-get install openjdk-7-jre-headless -y

apt-get install firefox -y
apt-get install xvfb -y


apt-get update
apt-get -y upgrade

cat <<EOT4 >> /etc/apache2/sites-enabled/000-default.conf

<Directory /var/www/>
        Options Indexes FollowSymLinks
        AllowOverride All
        Require all granted
</Directory>
EOT4




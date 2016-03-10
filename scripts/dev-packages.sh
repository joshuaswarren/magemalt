export DEBIAN_FRONTEND=noninteractive

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
apt-add-repository -y ppa:brightbox/ruby-ng
apt-get update
apt-get install -y --force-yes php5 php5-cli php5-xsl php5-intl
apt-get install -y --force-yes git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
apt-get install -y --force-yes ruby2.2 ruby2.2-dev
apt-get install -y --force-yes libgd-tools

apt-get install -y ruby-sass ruby-compass

gem install compass

apt-get install -y libapache2-mod-php5 apache2-utils links

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

apt-get install -y --force-yes mariadb-server mariadb-client libclone-perl libmldbm-perl libnet-daemon-perl libplrpc-perl libsql-statement-perl libipc-sharedcache-perl tinyca

apt-get install -y adminer phpmyadmin

apt-get install -y postgresql-9.3

apt-get install -y sqlite php5-sqlite libsqlite3-dev

apt-get install -y php5-redis

apt-get install -y php5-memcache php5-memcached php5-apcu

npm update

npm install grunt
npm install bower
npm install yeoman
npm install gulp
npm install browsersync
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

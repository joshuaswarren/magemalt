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

apt-get install -y python-software-properties software-properties-common
add-apt-repository -y ppa:ondrej/php5-5.6
apt-add-repository -y ppa:brightbox/ruby-ng
apt-get update
apt-get install -y php5
apt-get install -y git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev
apt-get install -y ruby2.2
apt-get install -y libgd-tools

php -r "readfile('https://getcomposer.org/installer');" > composer-setup.php
php -r "if (hash('SHA384', file_get_contents('composer-setup.php')) === 'fd26ce67e3b237fffd5e5544b45b0d92c41a4afe3e3f778e942e43ce6be197b9cdc7c251dcde6e2a52297ea269370680') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); }"
php composer-setup.php
php -r "unlink('composer-setup.php');"
mv /root/composer.phar /usr/local/bin/composer

apt-get install -y beanstalkd
apt-get install -y nodejs
apt-get install -y npm
apt-get install -y php5-mcrypt
apt-get install -y php5-curl

apt-get install -y mariadb-server-5.5 libclone-perl libmldbm-perl libnet-daemon-perl libplrpc-perl libsql-statement-perl libipc-sharedcache-perl tinyca

apt-get install -y postgresql-9.3

apt-get install -y sqlite php5-sqlite

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

composer global require "laravel/installer=~1.1"
composer global require "laravel/envoy=~1.0"

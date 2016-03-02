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
apt-get update
apt-get install -y php5

apt-get install -y ruby-dev ruby-bundler
gem install jekyll jekyll-watch

cd /opt/
git clone https://github.com/magento/devdocs
chmod -R a+rw /opt/devdocs
cd devdocs
bundle install


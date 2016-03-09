mysql -e "CREATE USER 'dev'@'localhost' IDENTIFIED BY 'dev';"
mysql -e "GRANT ALL on *.* TO 'dev'@'localhost';"
mysql -e "CREATE DATABASE magento;"
mysql -e "CREATE DATABASE magento2;"
mysql -e "CREATE DATABASE dev;"


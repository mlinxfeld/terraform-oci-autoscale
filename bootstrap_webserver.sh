echo '== 1. Installing HTTPD package with yum'
sudo -u root yum -y -q install httpd

echo '== 2. Creating /var/www/html/index.html'
sudo -u root touch /var/www/html/index.html
sudo /bin/su -c \"echo 'Welcome to FoggyKitchen.com! This is WEBSERVER...' > /var/www/html/index.html\"

echo '== 3. Disabling firewall and starting HTTPD service'
sudo -u root service firewalld stop
sudo -u root service httpd start


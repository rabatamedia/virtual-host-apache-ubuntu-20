mkdir -p /var/www/namwebsite.com
chown -R www-data.www-data /var/www/namwebsite.com/
chmod -R 755 /var/www
nano /etc/apache2/sites-available/namwebsite.com.conf

<VirtualHost *:80>
ServerAdmin admin@namwebsite.com
ServerName namwebsite.com
ServerAlias www.namwebsite.com
DocumentRoot /var/www/namwebsite.com
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>

<VirtualHost *:443>
ServerAdmin admin@namwebsite.com
ServerName namwebsite.com
ServerAlias www.namwebsite.com
DocumentRoot /var/www/namwebsite.com
ErrorLog ${APACHE_LOG_DIR}/error.log
CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>


sudo a2ensite namwebsite.com
sudo systemctl restart apache2

>>>>>>>>>>> UPLOAD DATA KE /var/www/namwebsite.com <<<<<<<<<<<<<<<

chown -R www-data.www-data /var/www/namwebsite.com/
chmod -R 755 /var/www
sudo systemctl restart apache2

>>>> selesai

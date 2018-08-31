#!/bin/sh

cat > /var/www/html/application/config/config.php <<EOF
<?php
\$config['language'] = 'en_US';
\$config['show_inactive_clients'] = false;
\$config['hide_empty_pools'] = true;
\$config[0]['label'] = '$LABEL';
\$config[0]['host'] = '$DB_HOST';
\$config[0]['login'] = '$DB_USER';
\$config[0]['password'] = '$DB_PASS';
\$config[0]['db_name'] = '$DB_NAME';
\$config[0]['db_type'] = '$DB_TYPE';
\$config[0]['db_port'] = '$DB_PORT';
?>
EOF

echo "date.timezone = $PHP_TIMEZONE" >> /etc/php.ini

/usr/sbin/httpd -D FOREGROUND

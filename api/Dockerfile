FROM registry.bingofresh.com/bingofresh/apache-php

RUN sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf && \
    a2enmod rewrite 

#adjust httpd-mpm.conf
RUN sed -i 's/StartServers.*5/StartServers            10/g' /etc/apache2/mods-enabled/mpm_prefork.conf && \
    sed -i 's/MinSpareServers.*5/MinSpareServers         10/g' /etc/apache2/mods-enabled/mpm_prefork.conf && \
    sed -i 's/MaxSpareServers.*10/MaxSpareServers         50/g' /etc/apache2/mods-enabled/mpm_prefork.conf && \
    sed -i -e '/MaxSpareServers.*0/a\	ServerLimit         3000' /etc/apache2/mods-enabled/mpm_prefork.conf && \
    sed -i 's/MaxRequestWorkers.*150/MaxRequestWorkers      1500/g' /etc/apache2/mods-enabled/mpm_prefork.conf && \
    sed -i 's/MaxConnectionsPerChild.*0/MaxConnectionsPerChild      5000/g' /etc/apache2/mods-enabled/mpm_prefork.conf

RUN echo "ErrorLog \"| /usr/bin/rotatelogs /var/log/apache2/bingo_%Y_%m_%d_error_log 86400 480\"" >> /etc/apache2/apache2.conf && \
    echo "CustomLog \"| /usr/bin/rotatelogs /var/log/apache2/bingo_%Y_%m_%d_access_log 86400 480\" combined"  >> /etc/apache2/apache2.conf

ADD ./app /app

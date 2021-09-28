# Nginx php mysql

11	15:16	ping www.google.es
    12	15:16	pkg update && pkg upgrade
    13	15:22	portsnap fetch update
    14	15:25	opnsense-code ports
    15	15:37	cd /usr/ports/lang/php73/
    16	15:37	make install clean
    17	15:44	php -v
    18	15:44	cd ..
    19	15:44	cd php73-extensions/
    20	15:44	make install clean
    21	15:46	ls
    22	15:46	vim Makefile
    23	15:46	cat Makefile
    24	15:48	pkg search php72 | egrep -i --color 'gd|mysqli|openssl'
    25	15:48	pkg search php73 | egrep -i --color 'gd|mysqli|openssl'
    26	15:49	pkg install php73-composer php-73-gd php73-json
    27	15:49	pkg search php73 | egrep -i --color 'gd|mysqli|openssl'
    28	15:49	pkg install php73-mysqli-7.3.27 php73-openssl-7.3.27
    29	15:49	service php-ftpm status
    30	15:49	service php-fpm status
    31	15:50	pkg search nginx
    32	15:50	pkg install nginx-1.18.0_50,2
    33	15:51	service nginx status
    34	15:51	vi /etc/rc.conf

```sh
pkg update && pkg upgrade
opnsense-code ports
pkg install nginx
pkg install php73-mysqli php73-openssl
pkg install vim-console
sysrc nginx_enable=YES
sysrc php_fpm_enable=YES
```

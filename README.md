### Start Nginx, MySQL, PHP-fpm and mount enclosing dir to PHP-fpm

1. Run `generate-certs.sh` to generate and add (for MacOS) SSL certificates. Add domain in dialog.
2. Add previously added domain to nginx/mysite.conf
3. Run docker-compose.sh to start docker-compose or run it directly. 

* xdebug port: 9008

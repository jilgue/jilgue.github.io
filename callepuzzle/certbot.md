CertBot
=======

* Parar haproxy: 

`docker stop haproxy`

* Actualizar certificado: 

`certbot certonly --standalone -d cloud.callepuzzle.com`

* Concatenar certificado: 

`cat /etc/letsencrypt/live/cloud.callepuzzle.com/cert.pem /etc/letsencrypt/live/cloud.callepuzzle.com/privkey.pem > /usr/local/etc/haproxy/cloud.callepuzzle.com.pem`

* Arrancar haproxy:

`ansible ...`
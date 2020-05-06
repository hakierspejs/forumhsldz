forum.hs-ldz.pl
----------------

docker-compose.yml and configuration based on 
https://github.com/bitnami/bitnami-docker-discourse

there is an issue with hard-coded UID in postgresql 
and redis containers, that's why discourse datadir 
is available for user 1001.

all data stored in /var/discourse directory

to decrypt variables use `make decrypt`

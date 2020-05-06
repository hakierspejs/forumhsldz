export DISCOURSE_UID_GID=1001:1001

build:
	docker-compose -f docker-compose.yml build

bash:
	docker-compose -f docker-compose.yml up --no-build -d
	docker-compose -f docker-compose.yml exec sftpserver bash

run:
	docker-compose -f docker-compose.yml up --build -d

down:
	docker-compose -f docker-compose.yml down
logs:
	docker-compose -f docker-compose.yml logs -f

dirs:
	mkdir -p /var/discourse/sidekiq_data
	mkdir -p /var/discourse/redis_data
	mkdir -p /var/discourse/postgresql_data
	mkdir -p /var/discourse/discourse_data
	chown -R $(DISCOURSE_UID_GID) /var/discourse

decrypt:
	openssl aes-256-cbc -d -a -in discourse.variables.env.enc -out discourse.variables.env
	openssl aes-256-cbc -d -a -in postgresql.variables.env.enc -out postgresql.variables.env
	openssl aes-256-cbc -d -a -in redis.variables.env.enc -out redis.variables.env

encrypt:
	openssl aes-256-cbc -a -salt -in discourse.variables.env -out discourse.variables.env.enc
	openssl aes-256-cbc -a -salt -in postgresql.variables.env -out postgresql.variables.env.enc
	openssl aes-256-cbc -a -salt -in redis.variables.env -out redis.variables.env.enc

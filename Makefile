all: db-create schema-load data-load

schema-load:
	psql film_library < schema.sql

data-load:
	psql film_library < movies.sql
	psql film_library < genres.sql
	psql film_library < languages.sql
	psql film_library < countries.sql
	psql film_library < production_companies.sql
	psql film_library < person.sql
	psql film_library < movie_crew.sql
	psql film_library < movie_cast.sql


db-reset:
	dropdb film_library || true
	createdb film_library

db-create:
	createdb film_library || echo 'skip'

connect:
	psql -d film_library

dev-setup: db-reset schema-load data-load

dev-docker-setup: dev-docker-build dev-docker-init

dev-docker-build:
	docker build . -t film_library

dev-docker-init:
	docker rm film_library || true
	docker run -e POSTGRES_PASSWORD=password --name film_library -v `pwd`:/film_library film_library

dev-docker-attach:
	docker exec -it -w /film_library -u postgres film_library bash


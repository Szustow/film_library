# Database: Film library
## Requirements

* Installed PostgreSQL and Git
* Created database with name `film_library`
* Created role with name of your system user

## Install

```bash
git clone https://github.com/Szustow/database.git
cd database
# load schema and insert data
make
# docker
make dev-docker-setup
make dev-docker-attach
```

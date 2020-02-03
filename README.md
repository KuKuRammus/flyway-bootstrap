# Flyway bootstrap
Type: PostgreSQL

## Installation
This project has a dependency on [Flyway](https://flywaydb.org/). To install Flyway, run
```bash
sh ./fetch_flyway.sh
```
inside of the migrations directory. After that, `flyway` executable should appear

## Usage

### Command line options
Every flyway command will require database JDBC url, username and password, which can be provided, using following parameters
* `url` - JDBC url. For PostgreSQL: `jdbc:postgresql://<host>:<port>/<dbname>`
* `user` - User name
* `password` - User password

For example
```bash
./flyway migrate -url=jdbc:postgresql://localhost:5432/example -user=hello -password=world
```

Additional command-line options can be found in [Flyway docs](https://flywaydb.org/documentation/commandline/)

### Creating new migrations
To create a new migration, create new SQL file inside `sql` directory, using following naming pattern
```
V<VERSION_MAJOR>_<VERSION_MINOR>__<DESCRIPTION>.sql
```
For example
```
V1_0__Create_cool_table.sql
```

### Migrating
To execute all migrations inside `sql` directory, run
```bash
./flyway migrate
```

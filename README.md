# docker-bacula-web

### How to run it

The following environment variables need to be passed to the container:

* `DB_TYPE` Bacula database type.
* `DB_HOST` Hostname or IP of the database server.
* `DB_PORT` Port for connecting to the database
* `DB_NAME` Name of the Bacula database
* `DB_USER` Username to authenticate with.
* `DB_PASS` Password of the database user.
* `PHP_TIMEZONE` Example: Europe/Berlin
* `LABEL` Used for catalog selector

#!/bin/bash
set -e

# See more in: https://graspingtech.com/docker-compose-postgresql/
#
# CREATE DATABASEs
#


#echo "Initializing database WSO2 databases"
#echo "Initializing database WSO2 database ($POSTGRES_DB)"
echo "Creating WSO2 databases using POSTGRESUSER: $POSTGRES_USER"

psql --variable=ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE mbstoredb;
    GRANT ALL PRIVILEGES ON DATABASE mbstoredb TO wso2user;
	GRANT ALL ON DATABASE mbstoredb TO PUBLIC;
    CREATE DATABASE registrydb;
    GRANT ALL PRIVILEGES ON DATABASE registrydb TO wso2user;
	GRANT ALL ON DATABASE registrydb TO PUBLIC;
    CREATE DATABASE identitydb;
    GRANT ALL PRIVILEGES ON DATABASE identitydb TO wso2user;
	GRANT ALL ON DATABASE identitydb TO PUBLIC;
    CREATE DATABASE identitymetricsdb;
    GRANT ALL PRIVILEGES ON DATABASE identitymetricsdb TO wso2user;
	GRANT ALL ON DATABASE identitymetricsdb TO PUBLIC;
    CREATE DATABASE identitycarbondb;
    GRANT ALL PRIVILEGES ON DATABASE identitycarbondb TO wso2user;
	GRANT ALL ON DATABASE identitycarbondb TO PUBLIC;
    CREATE DATABASE identitybpeldb;
    GRANT ALL PRIVILEGES ON DATABASE identitybpeldb TO wso2user;
	GRANT ALL ON DATABASE identitybpeldb TO PUBLIC;
    CREATE DATABASE esbcarbondb;
    GRANT ALL PRIVILEGES ON DATABASE esbcarbondb TO wso2user;
	GRANT ALL ON DATABASE esbcarbondb TO PUBLIC;
    CREATE DATABASE brscarbondb;
    GRANT ALL PRIVILEGES ON DATABASE brscarbondb TO wso2user;
	GRANT ALL ON DATABASE brscarbondb TO PUBLIC;
    CREATE DATABASE dsscarbondb;
    GRANT ALL PRIVILEGES ON DATABASE dsscarbondb TO wso2user;
	GRANT ALL ON DATABASE dsscarbondb TO PUBLIC;
    CREATE DATABASE gregmetricsdb;
    GRANT ALL PRIVILEGES ON DATABASE gregmetricsdb TO wso2user;
	GRANT ALL ON DATABASE gregmetricsdb TO PUBLIC;
    CREATE DATABASE gregbpeldb;
    GRANT ALL PRIVILEGES ON DATABASE gregbpeldb TO wso2user;
	GRANT ALL ON DATABASE gregbpeldb TO PUBLIC;
    CREATE DATABASE gregsocialdb;
    GRANT ALL PRIVILEGES ON DATABASE gregsocialdb TO wso2user;
	GRANT ALL ON DATABASE gregsocialdb TO PUBLIC;
    CREATE DATABASE apimgtdb;
    GRANT ALL PRIVILEGES ON DATABASE apimgtdb TO wso2user;
	GRANT ALL ON DATABASE apimgtdb TO PUBLIC;
    CREATE DATABASE amcarbondb;
    GRANT ALL PRIVILEGES ON DATABASE amcarbondb TO wso2user;
	GRANT ALL ON DATABASE amcarbondb TO PUBLIC;
    CREATE DATABASE ammetricsdb;
    GRANT ALL PRIVILEGES ON DATABASE ammetricsdb TO wso2user;
	GRANT ALL ON DATABASE ammetricsdb TO PUBLIC;
    CREATE DATABASE ascarbondb;
    GRANT ALL PRIVILEGES ON DATABASE ascarbondb TO wso2user;
	GRANT ALL ON DATABASE ascarbondb TO PUBLIC;
	CREATE DATABASE wsoam;
    GRANT ALL PRIVILEGES ON DATABASE wsoam TO wso2user;
	GRANT ALL ON DATABASE wsoam TO PUBLIC;
	CREATE DATABASE wsoamshare;
    GRANT ALL PRIVILEGES ON DATABASE wsoamshare TO wso2user;
	GRANT ALL ON DATABASE wsoamshare TO PUBLIC;
	
    ALTER ROLE wso2user CONNECTION LIMIT -1;
EOSQL

#
# Create Tables
#
#echo "Initializing database WSO2 databases"
#psql --username="wso2user" -d mbstoredb -f /tmp/postgres-sql/mb-init.sql
#psql --username="wso2user" -d identitydb -f /tmp/postgres-sql/carbon-init.sql
##Yes, two scripts, one database
#psql --username="wso2user" -d registrydb -f /tmp/postgres-sql/carbon-init.sql
#psql --username="wso2user" -d registrydb -f /tmp/postgres-sql/identity-init.sql
#
#
#psql --username="wso2user" -d identitymetricsdb -f /tmp/postgres-sql/metrics-init.sql
##Yes, two scripts, one database
#psql --username="wso2user" -d identitycarbondb -f /tmp/postgres-sql/carbon-init.sql
#psql --username="wso2user" -d identitycarbondb -f /tmp/postgres-sql/identity-init.sql
#psql --username="wso2user" -d identitybpeldb -f /tmp/postgres-sql/bpel-init.sql
#
#
#psql --username="wso2user" -d gregmetricsdb -f /tmp/postgres-sql/metrics-init.sql
#psql --username="wso2user" -d gregbpeldb -f /tmp/postgres-sql/bpel-init.sql
#psql --username="wso2user" -d gregsocialdb -f /tmp/postgres-sql/social-init.sql
#
#
#psql --username="wso2user" -d apimgtdb -f /tmp/postgres-sql/apimgt-init.sql
#psql --username="wso2user" -d amcarbondb -f /tmp/postgres-sql/carbon-init.sql
#psql --username="wso2user" -d ammetricsdb -f /tmp/postgres-sql/metrics-init.sql
#
#
#psql --username="wso2user" -d esbcarbondb -f /tmp/postgres-sql/carbon-init.sql
#psql --username="wso2user" -d brscarbondb -f /tmp/postgres-sql/carbon-init.sql
#psql --username="wso2user" -d dsscarbondb -f /tmp/postgres-sql/carbon-init.sql
#psql --username="wso2user" -d ascarbondb -f /tmp/postgres-sql/carbon-init.sql

#
# ADDED BY MATHEUS
#
psql --username="wso2user" -d wsoam -f /tmp/postgres-sql/mypostgres-apim.sql
psql --username="wso2user" -d wsoamshare -f /tmp/postgres-sql/mypostgres-shared.sql

#
# Add postgres conf
#
cp /tmp/postgres-sql/postgresql.conf /var/lib/postgresql/data/postgresql.conf

pg_createcluster 9.6 main --start

service postgresql restart

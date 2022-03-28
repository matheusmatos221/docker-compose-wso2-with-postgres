# POSTGRES
FROM postgres:9.6

LABEL maintainer="Matheus Matos <matheus.matos@accurate.com.br>"

# Add init scripts
#ADD init-wso2.sh /docker-entrypoint-initdb.d/init-wso2.sh
#ADDED IN DOCKERCOMPOSE

# expose ports
#(the original image have expose 5432, we don't need this again...)
#EXPOSE 5432 

# build arguments for external artifacts
ARG POSTGRES_CONNECTOR_VERSION=42.3.3

# add POSTGRES JDBC connector to server home as a third party library
# https://repo1.maven.org/maven2/org/postgresql/postgresql/42.3.3/
ADD --chown=wso2carbon:wso2 https://repo1.maven.org/maven2/org/postgresql/postgresql/${POSTGRES_CONNECTOR_VERSION}/postgresql-${POSTGRES_CONNECTOR_VERSION}.jar ${WSO2_SERVER_HOME}/repository/components/dropins/

ADD --chown=wso2carbon:wso2 https://repo1.maven.org/maven2/org/postgresql/postgresql/${POSTGRES_CONNECTOR_VERSION}/postgresql-${POSTGRES_CONNECTOR_VERSION}.jar ${WSO2_SERVER_HOME}/repository/components/lib/

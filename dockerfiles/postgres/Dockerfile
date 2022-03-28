# POSTGRES
FROM postgres:9.6

LABEL maintainer="Matheus Matos <matheus.matos@accurate.com.br>"


# build arguments for external artifacts
ARG POSTGRES_CONNECTOR_VERSION=42.3.3

# add POSTGRES JDBC connector to server home as a third party library
# https://repo1.maven.org/maven2/org/postgresql/postgresql/42.3.3/

ADD --chown=wso2carbon:wso2 https://repo1.maven.org/maven2/org/postgresql/postgresql/${POSTGRES_CONNECTOR_VERSION}/postgresql-${POSTGRES_CONNECTOR_VERSION}.jar ${WSO2_SERVER_HOME}/repository/components/dropins/

ADD --chown=wso2carbon:wso2 https://repo1.maven.org/maven2/org/postgresql/postgresql/${POSTGRES_CONNECTOR_VERSION}/postgresql-${POSTGRES_CONNECTOR_VERSION}.jar ${WSO2_SERVER_HOME}/repository/components/lib/

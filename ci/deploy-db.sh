#!/bin/bash
echo "Environment: $CI_ENVIRONMENT_NAME"
cd db/changelog
/usr/share/liquibase/$LIQUIBASE_VERSION/liquibase \
    --classpath=/usr/share/liquibase/$LIQUIBASE_VERSION/drivers/ojdbc10.jar \
    --driver=oracle.jdbc.OracleDriver \
    --changeLogFile=master.xml \
    --contexts="$CI_ENVIRONMENT_NAME" \
    --defaultSchemaName=STROY \
    --url=jdbc:oracle:thin:@$1 \
    --username=$2 \
    --password=$3 \
    --logLevel=info \
    update

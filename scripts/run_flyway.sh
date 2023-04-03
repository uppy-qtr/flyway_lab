#!/bin/bash
#The script for running migrations locally
BASE_PATH="/home/uppy/code/labs/flyway_lab"
ACCOUNT="nh32610.eu-central-1"
FLYWAY_USER="uppy"
FLYWAY_PASSWORD="${{SNOWFLAKE_PASS}}"
FLYWAY_DEFAULT_SCHEMA="YURY_POPOV"
DB_NAME="FLYWAY_LAB"
WAREHOUSE_NAME="COMPUTE_WH"
ROLE="ACCOUNTADMIN"
FLYWAY_URL="jdbc:snowflake://${ACCOUNT}.snowflakecomputing.com/?db=${DB_NAME}&warehouse=${WAREHOUSE_NAME}&role=${ROLE}"

docker run \
  --rm \
  -v "${BASE_PATH}/db/migrations":/flyway/sql \
  -e FLYWAY_USER=${FLYWAY_USER} \
  -e FLYWAY_PASSWORD=${FLYWAY_PASSWORD} \
  -e FLYWAY_DEFAULT_SCHEMA=${FLYWAY_DEFAULT_SCHEMA} \
  -e FLYWAY_URL=${FLYWAY_URL} \
  -e FLYWAY_PLACEHOLDER_REPLACEMENT="true" \
  -e FLYWAY_PLACEHOLDERS_WAREHOUSE=${WAREHOUSE_NAME} \
  -e FLYWAY_PLACEHOLDERS_DB_NAME=${DB_NAME} \
  -e FLYWAY_VALIDATE_MIGRATION_NAMING=true \
  flyway/flyway:9.10.1 $1

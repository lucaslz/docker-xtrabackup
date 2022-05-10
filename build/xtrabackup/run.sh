#!/bin/bash

docker run \
--volumes-from my-database \
-v /dados/backups/mysql:/backups/mysql \
-v /dados/scripts:/scripts
--rm backup

# echo "\n\nXTRABACKUP_TARGET_DIR: ${XTRABACKUP_TARGET_DIR}"
# echo "\n\nXTRABACKUP_SOURCE_DIR: ${XTRABACKUP_SOURCE_DIR}"
# echo "\n\nXTRABACKUP_SCRIPTS_DIR: ${XTRABACKUP_SCRIPTS_DIR}"
# echo "\n\nMYSQL_CONTAINER: ${MYSQL_CONTAINER}"

# echo "Teste"
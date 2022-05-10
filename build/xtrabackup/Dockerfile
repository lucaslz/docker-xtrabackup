FROM ubuntu:20.04

LABEL MAINTAINER="Martin Helmich <m.helmich@mittwald.de>"

ENV XTRABACKUP_TARGET_DIR="/backups/mysql" \
    XTRABACKUP_SOURCE_DIR="/var/lib/mysql" \
    XTRABACKUP_SCRIPTS_DIR="/scripts" \
    MYSQL_CONTAINER="mysql"

RUN apt-get -y update && apt-get install -y curl wget tar lsb-release gnupg2 openssl

RUN cd /tmp

RUN curl -LO https://repo.percona.com/apt/percona-release_latest.focal_all.deb

RUN dpkg -i ./percona-release_latest.focal_all.deb

RUN apt-get  -y update && apt-get -y install percona-xtrabackup-24 qpress rsync

RUN useradd -ms /bin/bash sammy

RUN usermod -aG backup sammy

RUN usermod -aG sudo sammy

RUN grep backup /etc/group

RUN mkdir -p /backups/mysql

RUN mkdir -p /backups/mysql

RUN mkdir -p /var/lib/mysql

RUN chown backup /backups/mysql

RUN printf '%s' "$(openssl rand -base64 24)" | tee /backups/mysql/encryption_key && echo

RUN apt-get -qq autoclean && apt-get -qq autoremove && rm -rf /tmp/* /var/cache/apt/* /var/cache/depconf/*

VOLUME /backups/mysql

VOLUME /var/backup/mysql

VOLUME /scripts

COPY run.sh /usr/local/bin/

RUN chmod +x /usr/local/bin/run.sh

USER sammy

WORKDIR /backups/mysql

ENTRYPOINT ["run.sh"]
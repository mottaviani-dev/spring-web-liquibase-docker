FROM openjdk:19-jdk-alpine

COPY ../ /var/www/app

WORKDIR /var/www/app

RUN chmod +x /var/www/app/gradlew

RUN apk add --no-cache mysql-client bash wget

ARG liquibase_version=4.19.0
ARG liquibase_download_url=https://github.com/liquibase/liquibase/releases/download/v${liquibase_version}/liquibase-${liquibase_version}.tar.gz

RUN apk --no-cache add curl ca-certificates \
    && mkdir /opt/liquibase \
    && cd /opt/liquibase \
    && curl -SL -o liquibase-${liquibase_version}-bin.tar.gz ${liquibase_download_url} \
    && tar -xzf liquibase-${liquibase_version}-bin.tar.gz \
    && rm liquibase-${liquibase_version}-bin.tar.gz \
    && chmod +x liquibase \
    && cd lib \
    && wget https://repo1.maven.org/maven2/com/mysql/mysql-connector-j/8.0.31/mysql-connector-j-8.0.31.jar \
    && ln -s /opt/liquibase/liquibase /usr/local/bin/liquibase

RUN alias drop-tables='liquibase drop-all --url jdbc:mysql://db:3306/profile_website --classpath /opt/liquibase/lib/mysql-connector-j-8.0.31.jar --password rootpassword'
RUN alias update-tables='liquibase update --url jdbc:mysql://db:3306/profile_website --changelog-file=src/main/resources/db/changelog/db.changelog-master.yaml --classpath /opt/liquibase/lib/mysql-connector-j-8.0.31.jar --password rootpassword'

EXPOSE 8080

CMD ["sh", "-c", "./gradlew bootRun --args='--spring.datasource.url=jdbc:mysql://db:3306/profile_website --spring.datasource.username=root --spring.datasource.password=rootpassword'"]

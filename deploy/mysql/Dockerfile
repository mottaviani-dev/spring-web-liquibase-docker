FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD=Test1234

COPY custom.cnf /etc/mysql/conf.d/custom.cnf

EXPOSE 3306
CMD ["mysqld"]

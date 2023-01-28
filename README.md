# spring-web-liquibase-docker
A simple Web Application that uses liquibase to version the database and docker for containerization.

* It uses Liquibase as Database version manager
* Docker support development 

# Getting Started

### Reference Documentation
For further reference, please consider the following sections:

* [Official Gradle documentation](https://docs.gradle.org)
* [Spring Boot Gradle Plugin Reference Guide](https://docs.spring.io/spring-boot/docs/3.0.2/gradle-plugin/reference/html/)
* [Spring Web](https://docs.spring.io/spring-boot/docs/3.0.2/reference/htmlsingle/#web)

### Guides
The following guides illustrate how to use some features concretely:

* To spin up the containers run the `develop.bat up` command from windows or `make up` from ubuntu
* Once the container are started the application one will run the simple `./gradlew bootRun` that will install the dependancies.
* Liquibase is disabled by default in spring , but is also installed in the image, so once connected to the container runs the commands : `liquibase update` or the alias `update-tables`
* for dropping the database run `liquibase drop-all` or the alias `drop-tables`


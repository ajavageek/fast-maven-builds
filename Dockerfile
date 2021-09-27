# docker build -t fast-maven:1.4 .
FROM openjdk:11-slim-buster as build

ADD https://github.com/mvndaemon/mvnd/releases/download/0.6.0/mvnd-0.6.0-linux-amd64.zip .

RUN apt-get update \
 && apt-get install unzip \
 && mkdir /opt/mvnd \
 && unzip mvnd-0.6.0-linux-amd64.zip \
 && mv mvnd-0.6.0-linux-amd64/* /opt/mvnd

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN /opt/mvnd/bin/mvnd -B package

FROM openjdk:11-jre-slim-buster

COPY --from=build target/fast-maven-builds-1.4.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "fast-maven-builds-1.4.jar"]

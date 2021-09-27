# syntax=docker/dockerfile:experimental
# docker build -t fast-maven:1.3 .
FROM openjdk:11-slim-buster as build

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN --mount=type=cache,target=/root/.m2,rw ./mvnw -B package

FROM openjdk:11-jre-slim-buster

COPY --from=build target/fast-maven-builds-1.3.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "fast-maven-builds-1.3.jar"]

# docker build -t fast-maven:1.0 .
FROM openjdk:11-slim-buster as build

COPY .mvn .mvn
COPY mvnw .
COPY pom.xml .
COPY src src

RUN ./mvnw -B package

FROM openjdk:11-jre-slim-buster

COPY --from=build target/fast-maven-builds-1.0.jar .

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "fast-maven-builds-1.0.jar"]

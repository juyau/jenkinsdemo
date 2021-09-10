FROM openjdk:8-alpine3.9
MAINTAINER samuel
ENV TZ Australia/Sydney
ARG JAR_FILE
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java", "-jar", "/app.jar"]
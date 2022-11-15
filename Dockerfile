# FROM openjdk:8-jre-alpine

# WORKDIR /helloSpringBoot

# EXPOSE 8080

# COPY target/hello-springboot-0.0.1-SNAPSHOT.jar .

# CMD [ "java","-jar","hello-springboot-0.0.1-SNAPSHOT.jar" ]

# FROM adoptopenjdk/openjdk11:alpine
# RUN addgroup -S spring && adduser -S spring -G spring
# USER spring:spring
# VOLUME /tmp
# ARG JAR_FILE
# ADD ${JAR_FILE} /app/app.jar
# EXPOSE 8080
# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app/app.jar"]

# FROM openjdk:8-jdk-alpine
# ARG JAR_FILE=./target/.jar
# COPY ${JAR_FILE} app.jar
# # COPY target/*.jar app.jar
# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

# FROM openjdk:8-jdk-alpine
# VOLUME /tmp
# ADD dockerapp-0.0.1-SNAPSHOT.jar app.jar
# RUN bash -c 'touch /app.jar'
# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]

# FROM openjdk:8-jdk-alpine
# ARG JAR_FILE= repo/target/dockerapp-0.0.1-SNAPSHOT.jar
# COPY ${JAR_FILE} app.jar

# # # include datadog java agent for APM integration
# RUN curl -L 'https://github.com/DataDog/dd-trace-java/releases/latest/download/dd-java-agent.jar' -o dd-java-agent.jar

# ENTRYPOINT exec java $JAVA_OPTS  -jar /app.jar
# #ENTRYPOINT ["java","-jar","/app.jar"]


FROM amazoncorretto:latest

COPY ./target/*.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
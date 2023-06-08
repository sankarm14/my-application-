FROM maven:3.6.3-jdk-11-slim AS build
WORKDIR /app
COPY pom.xml . COPY src/ ./src/
RUN mvn clean package
FROM openjdk:11-jre-slim 
WORKDIR /app
COPY --from=build /app/target/myapp.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

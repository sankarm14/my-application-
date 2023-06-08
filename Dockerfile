FROM ubuntu AS build
WORKDIR /home/ubuntu
add https://dlcdn.apache.org/maven/maven-3/3.9.2/binaries/apache-maven-3.9.2-bin.tar.gz
RUN mvn clean package
FROM openjdk:11-jre-slim 
WORKDIR /home/ubuntu
COPY --from=build /home/ubuntu/target/myapp.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]

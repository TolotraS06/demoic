FROM maven:3.9.6-eclipse-temurin-17 AS build

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests

FROM eclipse-temurin:17-jre

COPY --from=build /target/*.jar DemoIC-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "DemoIC-0.0.1-SNAPSHOT.jar"]

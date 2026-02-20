FROM openjdk:17-jdk-slim
COPY target/profiling-demo.jar app.jar
ENV SPRING_PROFILES_ACTIVE=prod
ENTRYPOINT ["java", "-jar", "/app.jar"]

# Use a base image with Java 17 (or adjust to Java 11 if preferred)
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the container
COPY target/timesheet-devops.jar /app/timesheet-devops.jar

# Expose the port that the application will run on
EXPOSE 8079

# Set default environment variables (can be overridden at runtime)
ENV SERVER_PORT=8079 \
    DB_HOST=mysql \
    DB_PORT=3306 \
    DB_NAME=timesheet-devops-db \
    DB_USERNAME=root \
    DB_PASSWORD= \
    LOG_PATH=/logs/timesheet-devops.log

# Create the log directory if it does not exist
RUN mkdir -p /logs

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "timesheet-devops.jar"]

# Use an official Maven image to build the project
FROM maven:3.8.6-openjdk-11 as build

# Set the working directory in the container
WORKDIR /app

# Copy the project's pom.xml and source code to the container
COPY pom.xml .
COPY src ./src

# Build the application
RUN mvn clean package

# Use a lightweight Java image for the runtime
FROM tomcat:10.1-jdk11-corretto

# Copy the built WAR file to the Tomcat webapps directory
COPY --from=build /app/target/Notetaker.war /usr/local/tomcat/webapps/Notetaker.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]

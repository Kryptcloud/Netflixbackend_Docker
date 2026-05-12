FROM ubuntu

RUN apt-get update && \
    apt-get install -y openjdk-17-jre-headless maven && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./src /app/src
COPY ./pom.xml /app

RUN mvn -f /app/pom.xml clean package -DskipTests && \
    cp /app/target/*.jar /app/app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]




# ==========================
# FROM eclipse-temurin:25
# RUN mkdir /opt/app
# COPY japp.jar /opt/app
# CMD ["java", "-jar", "/opt/app/japp.jar"]

FROM openjdk:8
EXPOSE 8080
ADD target/*.jar spring-boot-docker.jar 
ENTRYPOINT ["java","-jar","/spring-boot-docker.jar"]

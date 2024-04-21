FROM arm64v8/debian:bookworm-slim
RUN apt-get update -q && apt-get install -y git && apt-get install -y -q openjdk-17-jre openjdk-17-jdk-headless && apt-get install maven -y
RUN git clone https://github.com/FlorianGubler/floriangubler.ch
RUN cd floriangubler.ch && mvn install -Drevision=0.0.1

ENTRYPOINT ["java", "-jar", "floriangubler-ch-0.0.1.jar"]
EXPOSE 8080
# To build run: docker build --build-arg REVISION=0.0.1 --platform linux/arm64 --progress=plain -t florianzh/floriangubler-ch:0.0.1 .

FROM arm64v8/debian:bookworm-slim
ENV INSTALL_PATH="/srv/java/floriangubler-ch"
ARG REVISION
ENV REVISION_ENV=$REVISION
RUN apt-get update -q && apt-get install -y git && apt-get install -y -q openjdk-17-jre openjdk-17-jdk-headless && apt-get install maven -y
RUN mkdir -p $INSTALL_PATH
RUN git clone https://github.com/FlorianGubler/floriangubler.ch $INSTALL_PATH
RUN cd $INSTALL_PATH && mvn install -Drevision=$REVISION_ENV

RUN ls $INSTALL_PATH/target
ENTRYPOINT java -jar $INSTALL_PATH/target/floriangubler-ch-$REVISION_ENV.jar
EXPOSE 8080
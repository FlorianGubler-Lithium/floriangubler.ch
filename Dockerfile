# To build run: docker build --build-arg REVISION=0.0.1 --platform linux/arm64v8 --progress=plain -t florianzh/floriangubler-ch:0.0.1 .

FROM arm64v8/openjdk:17-slim
ENV INSTALL_PATH="/deployment"
ARG REVISION
ENV REVISION_ENV=$REVISION
RUN apt-get update
COPY ./target/floriangubler-ch-$REVISION_ENV.jar $INSTALL_PATH/florianubler-ch.jar

ENTRYPOINT java -jar $INSTALL_PATH/florianubler-ch.jar
EXPOSE 8080

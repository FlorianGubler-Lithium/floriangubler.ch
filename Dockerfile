# To build run: docker build --build-arg REVISION=0.0.1 --platform linux/arm64v8 --progress=plain -t florianzh/floriangubler-ch:0.0.1 .

FROM arm64v8/openjdk:17-slim
ENV INSTALL_PATH="/deployment"
ARG REVISION
ENV REVISION_ENV=$REVISION
COPY ./target/floriangubler-ch-$REVISION_ENV.jar $INSTALL_PATH/floriangubler-ch.jar

ENTRYPOINT java -jar $INSTALL_PATH/floriangubler-ch.jar
EXPOSE 443
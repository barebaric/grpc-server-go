FROM golang:1.13-alpine as build-env

ENV PROTOC_VER=v3.12.3
ENV PROTOC_ZIP=protoc-3.12.3-linux-x86_64.zip
ENV GO111MODULE=on 

WORKDIR /app
COPY compile.sh entrypoint.sh ./
COPY server server
COPY service service

RUN apk add --no-cache --update curl unzip build-base autoconf automake libtool ca-certificates \
    && go get google.golang.org/grpc \
    && go get github.com/golang/protobuf/protoc-gen-go \
    && go get -u -v github.com/golang/protobuf/proto \
    && apk add --no-cache --update protoc protobuf \
    && curl -OL https://github.com/protocolbuffers/protobuf/releases/download/$PROTOC_VER/$PROTOC_ZIP \
    && unzip -o $PROTOC_ZIP -d /usr/local 'include/*' \
    && rm -f $PROTOC_ZIP

EXPOSE 80
CMD ["./entrypoint.sh"]

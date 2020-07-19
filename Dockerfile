FROM golang:1.13-alpine as build-env

ENV PROTOC_VER=v3.12.3
ENV PROTOC_ZIP=protoc-3.12.3-linux-x86_64.zip
ENV GO111MODULE=on 

WORKDIR /app
COPY go.mod entrypoint.sh ./
COPY cmd cmd
COPY proto proto
COPY pkg pkg

RUN apk add --no-cache --update git curl unzip build-base autoconf automake libtool ca-certificates \
    && go get google.golang.org/grpc \
    && go get github.com/golang/protobuf/protoc-gen-go \
    && go get -u -v github.com/golang/protobuf/proto \
    && apk add --update protoc \
    && apk add --update protobuf \
    && curl -OL https://github.com/protocolbuffers/protobuf/releases/download/$PROTOC_VER/$PROTOC_ZIP \
    && unzip -o $PROTOC_ZIP -d /usr/local 'include/*' \
    && rm -f $PROTOC_ZIP \
    && go mod download \
    && cd cmd \
    && ./compile.sh \
    && cd -
RUN go build -o cmd/start cmd/start.go

EXPOSE 80
CMD ["./entrypoint.sh"]

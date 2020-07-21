#!/usr/bin/env sh
set -x

# Compile all .proto files
cd server/proto
ls -1 *.proto 2>/dev/null | while read FILENAME; do
    protoc -I /usr/local/include/ -I. "$FILENAME" --go_out=plugins=grpc:.
done
cd -

# Build the server
cd server
go mod download
go build -o cmd/start cmd/start.go || exit 1
cd -

# Build the service as a Go plugin
cd service
go mod download
go build -buildmode=plugin -o ../server/cmd/service.so main.go || exit 1
cd -

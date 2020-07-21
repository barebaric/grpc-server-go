#!/usr/bin/env sh
set -x

# Compile all .proto files
cd proto
ls -1 *.proto 2>/dev/null | while read FILENAME; do
    protoc -I /usr/local/include/ -I. "$FILENAME" --go_out=plugins=grpc:.
done
cd -

# Make the compiled files available to the server and the service
mkdir -p server/proto
mkdir -p service/proto
ls -1 proto/*.pb.go 2>/dev/null | while read FILENAME; do
    ln -s ../../$FILENAME server/$FILENAME
    ln -s ../../$FILENAME service/$FILENAME
done

# Build the service as a Go plugin
cd service
go mod download
go build -buildmode=plugin -o ../server/cmd/service.so main.go || exit 1
cd -

# Build the server
cd server
go mod download
go build -o cmd/start cmd/start.go || exit 1
cd -

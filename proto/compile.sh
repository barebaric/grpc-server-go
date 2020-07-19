#!/usr/bin/env sh

ls -1 *.proto 2>/dev/null | while read FILENAME; do
    protoc -I. "$FILENAME" --go_out=plugins=grpc:.
done

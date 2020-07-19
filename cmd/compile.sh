#!/usr/bin/env sh

cd ../proto
ls -1 *.proto 2>/dev/null | while read FILENAME; do
    protoc -I. "$FILENAME" --go_out=plugins=grpc:.
done
cd -

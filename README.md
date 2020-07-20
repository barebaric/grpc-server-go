# gRPC server for Golang/protobuf

Patches welcome!

Example usage:

```docker
FROM knipknap/grpc-server-go:latest
WORKDIR /app
COPY go.mod .
COPY pkg pkg
COPY service.proto proto/
```

Any .proto files that you put into the /proto folder will automatically be compiled on startup,
using protoc.

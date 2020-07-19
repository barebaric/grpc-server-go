# gRPC server for Golang/protobuf

Patches welcome!

Example usage:

```docker
FROM knipknap/grpc-server-go:latest
COPY service.proto /proto 
COPY go.mod pkg /app
```

Any .proto files that you put into the /proto folder will automatically be compiled on startup,
using protoc.

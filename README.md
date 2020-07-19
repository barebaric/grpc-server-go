# gRPC server for Golang/protobuf

Patches welcome!

Example usage:

```docker
FROM knipknap/grpc-server-go:latest
COPY go.mod pkg /app
COPY service.proto /app/proto/
```

Any .proto files that you put into the /proto folder will automatically be compiled on startup,
using protoc.

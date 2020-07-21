# gRPC server for Golang/protobuf

Patches welcome!

Example usage:

```docker
FROM knipknap/grpc-server-go:latest
WORKDIR /app
COPY service.proto proto/
COPY go.mod main.go service/
```

The package name in main.go MUST be "main", and MUST have a function

```go
func New(logger *zap.SugaredLogger) proto.ServiceServer {
}
```

Any .proto files that you put into the proto/ folder are automatically be compiled during
the build, using protoc.
Similarly, your plugin is also automatically compiled on startup.

# gRPC server for Golang/protobuf

Patches welcome!

Example usage:

```docker
FROM knipknap/grpc-server-go:latest
WORKDIR /app
COPY service.proto server/proto/
COPY go.mod main.go service/
```

The package name in main.go MUST be "main", and MUST have a function

```go
func New(logger *zap.SugaredLogger) proto.ServiceServer {
}
```

Any .proto files that you put into the server/proto/ folder are automatically
compiled during the build, using protoc.
Similarly, your plugin is also automatically compiled on startup.

Important: The proto module is then available as

    github.com/barebaric/grpc-server-go/proto

You can import it using the following in your mod file:

```
module your.module

go 1.14

require (
	github.com/barebaric/grpc-server-go
	...
)

replace github.com/barebaric/grpc-server-go => ../server
```

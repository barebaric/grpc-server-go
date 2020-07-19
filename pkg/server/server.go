package server

import (
	"github.com/barebaric/grpc-server-go/proto"
	"go.uber.org/zap"
)

// Server is the service that implements the grpc service interface
type server struct {
	logger *zap.Logger
	suggar *zap.SugaredLogger
}

// NewServiceServer returns an implementation of ServiceServer
func NewServiceServer(logger *zap.Logger) proto.ServiceServer {
	return &server{
		logger: logger,
		suggar: logger.Sugar(),
	}
}

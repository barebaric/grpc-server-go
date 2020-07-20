package server

import (
	"grpc-server-go.localhost/proto"
	"go.uber.org/zap"
)

type MicroModel struct {
	logger *zap.Logger
}

func New(logger *zap.Logger) proto.ServiceServer {
	return &MicroModel{
		logger: logger,
	}
}

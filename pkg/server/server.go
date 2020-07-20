package service

import (
	"grpc-server-go.local/proto"
	"go.uber.org/zap"
)

type service struct {
	logger *zap.Logger
}

func New(logger *zap.Logger) proto.ServiceServer {
	return &service{
		logger: logger,
	}
}

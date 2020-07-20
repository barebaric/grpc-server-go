package service

import (
	"grpc-server-go.local/proto"
	"go.uber.org/zap"
)

type service struct {
	logger *zap.SugaredLogger
}

func New(logger *zap.SugaredLogger) proto.ServiceServer {
	return &service{
		logger: logger,
	}
}

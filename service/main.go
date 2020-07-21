package main

import (
	"github.com/barebaric/grpc-server-go/proto"
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

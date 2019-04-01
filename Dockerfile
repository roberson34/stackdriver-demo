FROM golang:alpine AS builder

WORKDIR $GOPATH/src/github.com/roberson34/stackdriver-demo

COPY . .

COPY gopath/bin/stackdriver-demo /stackdriver-demo

CMD "/stackdriver-demo"

EXPOSE 80
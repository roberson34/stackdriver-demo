FROM golang:alpine AS builder

WORKDIR $GOPATH/src/github.com/roberson34/stackdriver-demo

COPY . .

COPY gopath/bin/stackdriver-demo /stackdriver-demo

# CMD "/go/bin/go-cloud-debug-agent/stackdriver-demo"
ADD go-cloud-debug /
ADD source-context.json /

CMD ["/go-cloud-debug","-sourcecontext=./source-context.json", "-appmodule=go-errrep","-appversion=1.0","--","/stackdriver-demo"]


EXPOSE 80
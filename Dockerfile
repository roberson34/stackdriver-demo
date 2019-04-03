FROM golang:debian

WORKDIR $GOPATH/src/github.com/roberson34/stackdriver-demo

COPY . .

COPY gopath/bin/stackdriver-demo /stackdriver-demo

ADD gopath/bin/go-cloud-debug-agent /

ADD source-context.json /

CMD ["/go-cloud-debug-agent","-sourcecontext=./source-context.json", "-appmodule=go-errrep","-appversion=1.0","--","/stackdriver-demo"]


EXPOSE 80
FROM golang:alpine

RUN apk add git
RUN go get -u cloud.google.com/go/cmd/go-cloud-debug-agent

COPY . .
RUN CGO_ENABLED=0 go build -gcflags=all='-N -l' .
COPY gopath/bin/stackdriver-demo /stackdriver-demo
ADD source-context.json /

CMD ["gopath/bin/go-cloud-debug-agent","-sourcecontext=/source-context.json", "-appmodule=stackdriver-demo","-appversion=1.0","--","/stackdriver-demo"]
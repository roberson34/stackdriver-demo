FROM golang:alpine

RUN apk add git
RUN go get -u cloud.google.com/go/cmd/go-cloud-debug-agent

COPY . .
RUN CGO_ENABLED=0 go build -gcflags=all='-N -l' .
ADD source-context.json /

CMD ["bin/go-cloud-debug-agent","-sourcecontext=/source-context.json", "-appmodule=stackdriver-demo","-appversion=1.0","--","/stackdriver-demo"]
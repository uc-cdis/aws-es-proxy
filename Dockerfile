FROM golang:1.20-alpine

WORKDIR /go/src/github.com/abutaha/aws-es-proxy

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN go build -o /aws-es-proxy

FROM alpine:3.17
LABEL name="aws-es-proxy" \
      version="latest"

ENTRYPOINT ["/aws-es-proxy"] 
CMD ["-h"]

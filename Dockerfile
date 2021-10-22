FROM quay.io/cdis/golang:1.17-bullseye as build-deps

ENV CGO_ENABLED=0
ENV GOOS=linux
ENV GOARCH=amd64

WORKDIR /go/src/github.com/abutaha/aws-es-proxy

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

RUN go build -o /aws-es-proxy

LABEL name="aws-es-proxy" \
      version="latest"

ENTRYPOINT ["/aws-es-proxy"] 
CMD ["-h"]

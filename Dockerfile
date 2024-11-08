FROM golang:1.20-alpine AS builder

WORKDIR /go/src/github.com/abutaha/aws-es-proxy
COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build -o aws-es-proxy
RUN echo "nobody:x:65534:65534:Nobody:/:" > /etc_passwd

FROM alpine:3.17
LABEL name="aws-es-proxy" \
      version="latest"

RUN apk --no-cache add ca-certificates
WORKDIR /home/


FROM scratch

COPY --from=builder /etc_passwd /etc/passwd
COPY --from=builder /go/src/github.com/abutaha/aws-es-proxy/aws-es-proxy /aws-es-proxy

ENV PORT_NUM 9200
EXPOSE ${PORT_NUM}

USER nobody
ENTRYPOINT ["/aws-es-proxy"] 
CMD ["-timeout", "180", "-endpoint", "https://$ES_ENDPOINT", "-verbose", "-listen", ":9200"]

FROM golang:1.20-alpine
RUN apk add --no-cache git make bash

RUN mkdir -p /go-cache \
 && chown 1000:1000 /go-cache

ENV GOCACHE=/go-cache
ENV GOFLAGS="-buildvcs=false"
WORKDIR /app
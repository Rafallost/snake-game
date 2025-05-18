FROM golang:1.20-alpine

RUN apk add --no-cache git make bash

# opcjonalnie przygotuj cache Go w katalogu z prawami 1000:1000
RUN mkdir -p /go-cache && chown 1000:1000 /go-cache
ENV GOCACHE=/go-cache

WORKDIR /app

# To wszystko – nie instalujemy tu Dockera ani Jenkins CLI.
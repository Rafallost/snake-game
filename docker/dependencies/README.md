# This image is used to build and test Go applications. It is based on golang:1.20-alpine and contains:
* git, make, bash
* Go cache under /go-cache with owner UID=1000
* Set GOCACHE and GOFLAGS="-buildvcs=false" for faster builds

# Local build
`docker build -t rafal206/dependencies:1.0 .`

# Docker push
`docker push rafal206/dependencies:1.0`

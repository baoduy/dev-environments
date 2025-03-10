FROM --platform=$BUILDPLATFORM alpine:latest

# install tools
RUN apk add --no-cache curl
RUN apk add --no-cache busybox
RUN apk add --no-cache busybox-extras

ENTRYPOINT ["-f", "/dev/null"]

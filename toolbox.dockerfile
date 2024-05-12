FROM alpine:latest

#install tools
RUN apk --no-cache add curl
RUN apk --no-cache add busybox
RUN apk --no-cache add busybox-extras

ENTRYPOINT ["tail", "-f", "/dev/null"]
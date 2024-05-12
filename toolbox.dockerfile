FROM --platform=$BUILDPLATFORM alpine:latest
ARG TARGETARCH
ARG BUILDPLATFORM

#install tools
RUN apk --no-cache add curl
RUN apk --no-cache add busybox
RUN apk --no-cache add busybox-extras

ENTRYPOINT ["tail", "-f", "/dev/null"]
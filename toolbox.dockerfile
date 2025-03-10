# updated on Feb 25
FROM --platform=$BUILDPLATFORM alpine:latest
ARG TARGETARCH
ARG BUILDPLATFORM

#install tools
RUN apk --no-cache add curl
RUN apk --no-cache add busybox
RUN apk --no-cache add busybox-extras
RUN apk --no-cache add coreutils

ENTRYPOINT ["tail", "-f", "/dev/null"]

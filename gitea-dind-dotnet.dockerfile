from --platform=$BUILDPLATFORM docker:dind
ARG TARGETARCH
ARG BUILDPLATFORM

run apk update
run apk add nodejs npm
run apk add git
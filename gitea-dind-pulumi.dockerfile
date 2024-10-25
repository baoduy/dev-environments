from --platform=$BUILDPLATFORM baoduy2412/gitea-dind-nodejs:latest
ARG TARGETARCH
ARG BUILDPLATFORM

USER root

# install pulimi
ENV PATH=$PATH:/root/.pulumi/bin
RUN apk update && \
    apk add --no-cache curl libc6-compat
RUN curl -fsSL https://get.pulumi.com | sh

# install pnpm
npm install -g pnpm

# install azure-cli
#RUN apk add py3-pip -q
#RUN apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo make -q
#RUN pip install --upgrade pip -q --break-system-packages
#RUN pip install azure-cli -q --break-system-packages
#RUN rm -rf /var/cache/apk/*

# Ensure the tool installed sucessfully
#RUN az --version
RUN pulumi version
FROM bitnami/azure-cli:latest as development
LABEL org.opencontainers.image.authors="drunkcoding.net <drunkcoding@outlook.com>"

ARG TARGETARCH
ARG BUILDPLATFORM
WORKDIR /src

USER root

# Install tools
RUN apt-get update -y \
    && apt-get install curl -y \
    && apt-get install git -y

RUN apt-get update
RUN apt-get install -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update
RUN apt-get install nodejs -y

RUN npm install -g npm@latest \
  && npm install -g npm-check-updates \
  && npm install -g pnpm

#RUN useradd -s /bin/bash -m vscode \
#     && groupadd docker \
#     && usermod -aG docker vscode

#RUN chown -R vscode:vscode /src
#RUN chmod 755 /src
#USER vscode

RUN curl -fsSL https://get.pulumi.com | sh
ENV PATH="$PATH:/.pulumi/bin"

# Ensure the tool installed sucessfully
RUN node --version
RUN pnpm --version
RUN az --version
RUN pulumi version


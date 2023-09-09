FROM nikolaik/python-nodejs:python3.11-nodejs18-slim as development
LABEL org.opencontainers.image.authors="drunkcoding.net <drunkcoding@outlook.com>"

ARG TARGETARCH
ARG BUILDPLATFORM
WORKDIR /src

USER root

# Install tools
RUN apt-get update -y \
    && apt-get install curl -y \
    && apt-get install git -y \
    && apt-get install sudo -y

#RUN sudo apt install python3-pip -y
#RUN pip3 install "pip>=20"
RUN pip3 install azure-cli
RUN npm install -g npm@latest
RUN npm install -g npm-check-updates

#RUN useradd -s /bin/bash -m vscode \
#     && groupadd docker \
#     && usermod -aG docker vscode

#RUN chown -R vscode:vscode /src
#RUN chmod 755 /src
#USER vscode

RUN curl -fsSL https://get.pulumi.com | sh
ENV PATH="$PATH:/root/.pulumi/bin"

RUN node --version
RUN npm --version
RUN az --version
RUN pulumi version

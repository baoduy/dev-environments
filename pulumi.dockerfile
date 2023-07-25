FROM node:19-slim as development
WORKDIR /src

USER root

# Install tools
RUN apt-get update \
    && apt-get install -y git \
    && apt-get -y install sudo

#RUN curl https://sh.rustup.rs -sSf | sh -s -- -y
RUN sudo apt install python3-pip -y
RUN pip3 install "pip>=20"
RUN pip3 install azure-cli

RUN npm install -g npm-check-updates

#RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# RUN useradd -s /bin/bash -m vscode \
#     && groupadd docker \
#     && usermod -aG docker vscode

# RUN chown -R vscode:vscode /src
# RUN chmod 755 /src
# USER vscode

RUN curl -fsSL https://get.pulumi.com | sh
ENV PATH="$PATH:/home/vscode/.pulumi/bin"

RUN node –version
RUN npm –version
RUN pulumi version
RUN az --version

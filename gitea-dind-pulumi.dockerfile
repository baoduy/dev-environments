from --platform=$BUILDPLATFORM baoduy2412/gitea-dind-nodejs:latest
ARG TARGETARCH
ARG BUILDPLATFORM

# Install tools
RUN apk add curl

RUN apk add -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apk update

RUN npm install -g npm@latest \
  && npm install -g npm-check-updates


RUN curl -fsSL https://get.pulumi.com | sh
ENV PATH="$PATH:/.pulumi/bin"

# Ensure the tool installed sucessfully
RUN az --version
RUN pulumi version
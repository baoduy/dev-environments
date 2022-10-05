FROM node:latest

RUN curl -fsSL https://get.pulumi.com | sh
RUN npm install -g npm-check-updates

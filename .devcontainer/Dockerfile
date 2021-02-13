# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.148.1/containers/javascript-node/.devcontainer/base.Dockerfile

# [Choice] Node.js version: 14, 12, 10
ARG VARIANT="14-buster"
FROM mcr.microsoft.com/vscode/devcontainers/javascript-node:0-${VARIANT}

# Only useful for debugging the Dockerfile. Ports are forwarded in the devcontainer.json file
EXPOSE 1313

# Install Hugo
RUN wget -O /tmp/hugo.deb https://github.com/gohugoio/hugo/releases/download/v0.57.0/hugo_extended_0.57.0_Linux-64bit.deb \
    && dpkg -i /tmp/hugo.deb

# Fix for https://github.com/yarnpkg/yarn/issues/7866
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -

# Install PowerShell
RUN export DEBIAN_FRONTEND=noninteractive \
    && wget https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb \
    && dpkg -i packages-microsoft-prod.deb \
    && apt-get update \
    && apt-get install -y powershell

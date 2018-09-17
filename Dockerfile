FROM jenkinsci/jnlp-slave:latest

USER root

# general tools
RUN apt-get update && apt-get install -y \
    file \
    sudo \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

# docker docker docker
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg2 \
    software-properties-common \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add - \
    && echo "deb [arch=amd64] https://download.docker.com/linux/debian stretch stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update \
    && apt-get install -y docker-ce=17.03.0~ce-0~debian-stretch \
    && apt-get remove -y \
    apt-transport-https \
    software-properties-common \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

# rust is love
RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh

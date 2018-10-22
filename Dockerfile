FROM jenkinsci/jnlp-slave:latest

USER root

# general tools
RUN apt-get update && apt-get install -y \
    file \
    sudo \
    && apt-get clean autoclean \
    && apt-get autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/

# rust is love
RUN curl -sSf https://static.rust-lang.org/rustup.sh | sh

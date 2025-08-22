FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies and clean up
RUN apt-get update --yes && \
    apt-get install --yes \
        curl jq sudo \
        libicu-dev libssl-dev

# Create a non-root user
RUN useradd -m jenkinsuser

# Add and extract GitHub Actions Runner
COPY actions-runner-linux-x64-2.328.0.tar.gz /tmp/actions-runner-linux-x64-2.328.0.tar.gz
RUN mkdir -p /opt/actions-runner && \
    tar -zxvf /tmp/actions-runner-linux-x64-2.328.0.tar.gz -C /opt/actions-runner && \
    cd /opt/actions-runner && \
    chmod 755 *.sh bin/*.sh && \
    chown -R jenkinsuser:jenkinsuser /opt/actions-runner && \
    bash bin/installdependencies.sh && \
    rm /tmp/actions-runner-linux-x64-2.328.0.tar.gz

RUN apt-get clean && \
    rm -rf /var/cache/apt/archives /var/lib/apt/lists

# Set working directory and switch to non-root user
WORKDIR /opt/actions-runner
USER jenkinsuser
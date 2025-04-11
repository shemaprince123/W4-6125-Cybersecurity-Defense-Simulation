FROM ubuntu:20.04

# Install necessary packages with retry mechanism
RUN apt-get update --allow-releaseinfo-change || (sleep 10 && apt-get update) && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    net-tools \
    iputils-ping \
    nano \
    tcpdump \
    iptables \
    && apt-get clean

# Install Snort separately to handle potential failures
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y snort || \
    (apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y snort)

# Make necessary directories
RUN mkdir -p /var/log/snort
RUN mkdir -p /etc/snort/rules

# Copy configuration files
COPY snort.conf /etc/snort/
COPY local.rules /etc/snort/rules/

# Setup permissions
RUN chmod -R 777 /var/log/snort
RUN chmod -R 777 /etc/snort

# Expose ports
EXPOSE 1514/udp

# Start Snort in IDS mode
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
FROM ubuntu:20.04

# Install necessary packages with retry mechanism
RUN apt-get update --allow-releaseinfo-change || (sleep 10 && apt-get update) && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    iptables \
    iputils-ping \
    net-tools \
    tcpdump \
    nano \
    rsyslog \
    && apt-get clean

# Make log directory
RUN mkdir -p /var/log/iptables

# Copy configuration files
COPY iptables-rules.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/iptables-rules.sh

# Setup rsyslog to capture iptables logs
COPY rsyslog.conf /etc/rsyslog.d/10-iptables.conf

# Start script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run the startup script
CMD ["/start.sh"]
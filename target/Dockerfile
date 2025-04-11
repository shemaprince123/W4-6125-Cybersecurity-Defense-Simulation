FROM ubuntu:20.04

# Install necessary packages and services with retry mechanism
RUN apt-get update --allow-releaseinfo-change || (sleep 10 && apt-get update) && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apache2 \
    openssh-server \
    php \
    libapache2-mod-php \
    unzip \
    sudo \
    net-tools \
    iputils-ping \
    nano \
    && apt-get clean

# We'll install filebeat separately later
# Configure SSH
RUN mkdir -p /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Install a vulnerable web application (DVWA)
RUN mkdir -p /var/www/html
RUN cd /tmp && \
    apt-get install -y wget && \
    wget https://github.com/digininja/DVWA/archive/master.zip && \
    unzip master.zip && \
    cp -r DVWA-master/* /var/www/html/ && \
    rm -rf /tmp/DVWA-master master.zip

# Set permissions for the web app
RUN chown -R www-data:www-data /var/www/html

# Create filebeat configuration but don't install it yet
COPY filebeat.yml /tmp/filebeat.yml

# Expose ports
EXPOSE 80 22

# Start services
COPY start.sh /start.sh
RUN chmod +x /start.sh
CMD ["/start.sh"]
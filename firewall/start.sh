#!/bin/bash

# Enable IP forwarding
echo 1 > /proc/sys/net/ipv4/ip_forward

# Apply the iptables rules
/usr/local/bin/iptables-rules.sh

# Start rsyslog for logging
service rsyslog start

# Keep the container running
tail -f /dev/null

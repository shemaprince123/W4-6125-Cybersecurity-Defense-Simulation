#!/bin/bash

# Start SSH server
service ssh start

# Start Apache server
service apache2 start

# We're skipping filebeat since it's not installed
# service filebeat start

# Keep container running
tail -f /dev/null
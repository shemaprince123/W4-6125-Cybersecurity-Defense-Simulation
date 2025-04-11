#!/bin/bash

# Run Snort in IDS mode
# -A console: output alerts to console
# -i eth0: listen on eth0 interface
# -c /etc/snort/snort.conf: use this configuration file
# -l /var/log/snort: log to this directory

snort -A console -i eth0 -c /etc/snort/snort.conf -l /var/log/snort

# If Snort exits, keep container running
tail -f /dev/null

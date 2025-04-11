#!/bin/bash

# Create necessary directories
mkdir -p target/logs
mkdir -p kali/tools kali/data
mkdir -p elk/elasticsearch/data
mkdir -p elk/logstash/config elk/logstash/pipeline
mkdir -p ids/config ids/logs
mkdir -p firewall/rules firewall/logs

# Set permissions for ELK data directory
chmod -R 777 elk/elasticsearch/data

# Start the containers
echo "Starting the cybersecurity defense simulation environment..."
docker-compose up -d

# Wait for all services to be ready
echo "Waiting for services to initialize (this may take a few minutes)..."
sleep 60

echo "Environment is ready. Here are your containers:"
docker ps

echo -e "\nAccess information:"
echo "- Kibana Dashboard: http://localhost:5601"
echo "- Target Web Server: http://localhost:80"
echo "- To access the Kali container: docker exec -it kali /bin/bash"
echo "- To view Snort IDS logs: docker exec -it ids cat /var/log/snort/alert"
echo "- To view Firewall logs: docker exec -it firewall cat /var/log/iptables/iptables.log"

echo -e "\nTo run a simple attack simulation (port scan from Kali to target):"
echo "docker exec -it kali nmap -sS target"

echo -e "\nTo stop the environment:"
echo "docker-compose down"

echo -e "\nHappy simulating!"

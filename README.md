# Cybersecurity Defense Simulation

## 📖 Overview

This project implements a comprehensive cybersecurity defense simulation environment using Docker containerization. It provides a practical learning environment for security monitoring, intrusion detection, attack analysis, and defense strategies.

The simulation focuses on three core security objectives:
- System log analysis for intrusion detection
- Network traffic analysis to identify attack patterns
- Defensive countermeasures using IDS and firewall configurations

## 🏗️ Architecture

Our containerized environment consists of:

- **Target Server**: A vulnerable Ubuntu server running Apache and SSH
- **Kali Linux**: Attack machine with penetration testing tools
- **ELK Stack**: Elasticsearch, Logstash, and Kibana for centralized logging
- **Snort IDS**: Intrusion Detection System for threat monitoring
- **Firewall**: Custom iptables firewall for traffic filtering
- **Dual Network**: Segmented internal and external networks

![Architecture Diagram](https://your-architecture-diagram-url.png)

## 🚀 Getting Started

### Prerequisites

- Docker & Docker Compose
- Git
- Minimum 8GB RAM, 20GB disk space

### Installation & Setup

1. Clone the repository:
```bash
git clone https://github.com/yourusername/cybersecurity-defense-sim.git
cd cybersecurity-defense-sim
```

2. Create required directories:
```bash
mkdir -p target/logs
mkdir -p kali/tools kali/data
mkdir -p elk/elasticsearch/data
mkdir -p elk/logstash/config elk/logstash/pipeline
mkdir -p ids/config ids/logs
mkdir -p firewall/rules firewall/logs
```

3. Set permissions:
```bash
chmod -R 777 elk/elasticsearch/data
chmod +x */*.sh
```

4. Start the environment:
```bash
docker-compose up -d
```

5. Verify all containers are running:
```bash
docker ps
```

## 🔍 Usage Guide

### Accessing Components

- **Kibana Dashboard**: http://localhost:5601
- **Target Web Server**: http://localhost:80
- **Elasticsearch API**: http://localhost:9200

### Accessing Containers

```bash
# Target server
docker exec -it target bash

# Kali Linux
docker exec -it kali bash

# IDS (Snort)
docker exec -it ids bash

# Firewall
docker exec -it firewall bash
```

### Running Simulations

#### Port Scanning Attack

```bash
# From Kali container
nmap -sS target
```

#### Web Application Attacks

```bash
# SQL Injection
curl "http://target/login.php?username=admin'%20OR%20'1'='1&password=anything"

# XSS Attack
curl "http://target/search.php?q=<script>alert('XSS')</script>"
```

#### SSH Brute Force

```bash
# From Kali container
for i in {1..10}; do sshpass -p "password$i" ssh -o StrictHostKeyChecking=no root@target echo "Test $i"; done
```

### Monitoring Defenses

#### View IDS Alerts

```bash
docker exec -it ids cat /var/log/snort/alert
```

#### Check Firewall Logs

```bash
docker exec -it firewall cat /var/log/iptables/iptables.log
```

## 📊 Lab Exercises

This environment supports several security lab exercises:

1. **System Logs Analysis**: Using Kibana to identify suspicious patterns
2. **Network Traffic Analysis**: Packet capture and analysis with tcpdump/Wireshark
3. **IDS Configuration**: Customizing Snort rules for threat detection
4. **Firewall Rule Management**: Implementing defensive iptables configurations
5. **Attack Simulation**: Testing security controls against common attacks

## 🛠️ Project Structure

```
cybersecurity-defense-sim/
├── docker-compose.yml        # Main configuration file
├── run-simulation.sh         # Helper script to run the environment
├── lab-exercises.md          # Documentation for lab exercises
├── target/                   # Vulnerable target server
│   ├── Dockerfile
│   ├── start.sh
│   └── filebeat.yml
├── ids/                      # Snort IDS configuration
│   ├── Dockerfile
│   ├── start.sh
│   ├── snort.conf
│   └── local.rules
├── firewall/                 # Firewall configuration
│   ├── Dockerfile
│   ├── start.sh
│   ├── iptables-rules.sh
│   └── rsyslog.conf
├── elk/                      # ELK Stack configuration
│   ├── elasticsearch/
│   └── logstash/
│       └── pipeline/
│           └── logstash.conf
└── kali/                     # Attack machine resources
    ├── tools/                # Custom attack tools
    └── data/                 # Data capture directory
```

## 🛡️ Security Configurations

### Snort IDS Rules

The IDS is configured with custom rules for:
- Port scanning detection
- SSH brute force detection
- SQL injection identification
- XSS attack detection
- DoS attack monitoring

### Firewall Configuration

The firewall implements:
- Default deny policy
- Rate limiting for SSH and ICMP
- Protection against SYN floods
- Port scan detection and blocking
- Malicious packet filtering (NULL, XMAS)

## 🔬 Technical Challenges & Solutions

This project addresses several technical challenges including:
- Container stability and permissions issues
- Line ending compatibility between different OSes
- Network segmentation in containerized environments
- Kernel module dependencies for security tools

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📝 License

Copyright © 2025 Shema Prince 🤴. All rights reserved.

This project and its contents are proprietary and confidential. Unauthorized copying, distribution, modification, public display, or public performance of this material is strictly prohibited. This software is provided for educational purposes only, and may only be used with explicit permission from the copyright holder.

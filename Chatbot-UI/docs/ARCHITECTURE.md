# Deployment Architecture

## Overview
Microservices-based Spring Boot application deployed on Kubernetes cluster.

## Architecture Components:
1. **Kubernetes Cluster**: 1 Master, 2 Worker nodes
2. **CI/CD Pipeline**: Jenkins/GitHub Actions
3. **Monitoring Stack**: Prometheus + Grafana
4. **Database**: MySQL with daily backups
5. **Cache**: Redis
6. **Load Balancer**: Nginx Ingress Controller

## Network Architecture:
- Service Mesh: Istio (optional)
- Ingress: Nginx Ingress Controller
- Network Policies: Calico CNI

## Security:
- Secrets management: HashiCorp Vault
- SSL/TLS: Cert-manager with Let's Encrypt
- Network Policies for pod communication

#!/bin/bash

echo "Setting up DevOps environment..."

# 1. Start Vagrant VMs
cd vagrant
vagrant up
cd ..

# 2. Setup Kubernetes
ansible-playbook ansible/playbooks/setup-k8s.yaml

# 3. Initialize Kubernetes cluster
vagrant ssh master -c "sudo kubeadm init --pod-network-cidr=192.168.0.0/16"

# 4. Setup monitoring
kubectl apply -f kubernetes/manifests/monitoring/

echo "Setup complete!"

#!/bin/bash
KUBERNETES_PUBLIC_ADDRESS="192.168.1.43"

# The kubelet Kubernetes Configuration File

for instance in worker-0 worker-1; do
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../04-certificate-authority/ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
    --kubeconfig=${instance}.kubeconfig

  kubectl config set-credentials system:node:${instance} \
    --client-certificate=../04-certificate-authority/${instance}.pem \
    --client-key=../04-certificate-authority/${instance}-key.pem \
    --embed-certs=true \
    --kubeconfig=${instance}.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:node:${instance} \
    --kubeconfig=${instance}.kubeconfig

  kubectl config use-context default --kubeconfig=${instance}.kubeconfig
done

# The kube-proxy Kubernetes Configuration File

{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../04-certificate-authority/ca.pem \
    --embed-certs=true \
    --server=https://${KUBERNETES_PUBLIC_ADDRESS}:6443 \
    --kubeconfig=kube-proxy.kubeconfig

  kubectl config set-credentials system:kube-proxy \
    --client-certificate=../04-certificate-authority/kube-proxy.pem \
    --client-key=../04-certificate-authority/kube-proxy-key.pem \
    --embed-certs=true \
    --kubeconfig=kube-proxy.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-proxy \
    --kubeconfig=kube-proxy.kubeconfig

  kubectl config use-context default --kubeconfig=kube-proxy.kubeconfig
}

# The kube-controller-manager Kubernetes Configuration File

{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../04-certificate-authority/ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=kube-controller-manager.kubeconfig

  kubectl config set-credentials system:kube-controller-manager \
    --client-certificate=../04-certificate-authority/kube-controller-manager.pem \
    --client-key=../04-certificate-authority/kube-controller-manager-key.pem \
    --embed-certs=true \
    --kubeconfig=kube-controller-manager.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-controller-manager \
    --kubeconfig=kube-controller-manager.kubeconfig

  kubectl config use-context default --kubeconfig=kube-controller-manager.kubeconfig
}

# The kube-scheduler Kubernetes Configuration File

{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../04-certificate-authority/ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=kube-scheduler.kubeconfig

  kubectl config set-credentials system:kube-scheduler \
    --client-certificate=../04-certificate-authority/kube-scheduler.pem \
    --client-key=../04-certificate-authority/kube-scheduler-key.pem \
    --embed-certs=true \
    --kubeconfig=kube-scheduler.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=system:kube-scheduler \
    --kubeconfig=kube-scheduler.kubeconfig

  kubectl config use-context default --kubeconfig=kube-scheduler.kubeconfig
}

# The admin Kubernetes Configuration File

{
  kubectl config set-cluster kubernetes-the-hard-way \
    --certificate-authority=../04-certificate-authority/ca.pem \
    --embed-certs=true \
    --server=https://127.0.0.1:6443 \
    --kubeconfig=admin.kubeconfig

  kubectl config set-credentials admin \
    --client-certificate=../04-certificate-authority/admin.pem \
    --client-key=../04-certificate-authority/admin-key.pem \
    --embed-certs=true \
    --kubeconfig=admin.kubeconfig

  kubectl config set-context default \
    --cluster=kubernetes-the-hard-way \
    --user=admin \
    --kubeconfig=admin.kubeconfig

  kubectl config use-context default --kubeconfig=admin.kubeconfig
}
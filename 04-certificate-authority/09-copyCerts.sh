#!/bin/bash

for instance in worker-0 worker-1; do
  vagrant scp ../04-certificate-authority/ca.pem ${instance}:~/
  vagrant scp ../04-certificate-authority/${instance}-key.pem ${instance}:~/
done

for instance in controller-0 controller-1; do
    vagrant scp ../04-certificate-authority/ca.pem ${instance}:~/ 
    vagrant scp ../04-certificate-authority/ca-key.pem ${instance}:~/ 
    vagrant scp ../04-certificate-authority/kubernetes-key.pem ${instance}:~/
    vagrant scp ../04-certificate-authority/kubernetes.pem ${instance}:~/
    vagrant scp ../04-certificate-authority/service-account-key.pem ${instance}:~/
    vagrant scp ../04-certificate-authority/service-account.pem ${instance}:~/
done
#!/bin/bash

for instance in controller-0 controller-1; do
    vagrant scp ../06-data-encryption-keys/encryption-config.yaml ${instance}:~/ 
done
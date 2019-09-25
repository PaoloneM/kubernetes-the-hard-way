# Kubernetes The Hard Way - My scripts

While attending to LFS258 Kubernetes Fundamentals class, I had to approach the [Kubernetes The Hard Way tutorial by Kelsey Hightower](https://github.com/kelseyhightower/kubernetes-the-hard-way).

In this repo I collect all scripts I developed following Kelsey's instructions.

This is a case study only, not intendet to be easily reproducible nor supported. 

## Tips

In [03-createClientCerts.sh](https://github.com/PaoloneM/kubernetes-the-hard-way/blob/7f610a6955f0d2cc62a13f305ef604ffb62230b6/04-certificate-authority/03-createClientCerts.sh) set INSTANCES_IP with Vagrant machines addresses

Run certificates copy script from compute resources directory: ```<repo-dir>/03-compute-resources (master *)$ ../04-certificate-authority/09-copyCerts.sh```
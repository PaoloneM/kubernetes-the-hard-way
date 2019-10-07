{

KUBERNETES_PUBLIC_ADDRESS="192.168.1.43"
KUBERNETES_PRIVATE_ADDRESSES="10.211.55.69,10.211.55.67"

KUBERNETES_HOSTNAMES=master,master.local,kubernetes,kubernetes.default,kubernetes.default.svc,kubernetes.default.svc.cluster,kubernetes.svc.cluster.local

cat > kubernetes-csr.json <<EOF
{
  "CN": "kubernetes",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "IT",
      "L": "Lecco",
      "O": "Kubernetes",
      "OU": "Kubernetes The Hard Way",
      "ST": "Lombardia"
    }
  ]
}
EOF

cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -hostname=${KUBERNETES_PRIVATE_ADDRESSES},${KUBERNETES_PUBLIC_ADDRESS},127.0.0.1,${KUBERNETES_HOSTNAMES} \
  -profile=kubernetes \
  kubernetes-csr.json | cfssljson -bare kubernetes

}

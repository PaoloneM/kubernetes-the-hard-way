INSTANCES=( worker-0 worker-1 )
INSTANCES_IP=( 10.211.55.68 10.211.55.70) 
for i in 0 1 
do
cat > ${INSTANCES[$i]}-csr.json <<EOF
{
  "CN": "system:node:node$${INSTANCES[$i]}",
  "key": {
    "algo": "rsa",
    "size": 2048
  },
  "names": [
    {
      "C": "IT",
      "L": "Lecco",
      "O": "system:nodes",
      "OU": "Kubernetes The Hard Way",
      "ST": "Lombardia"
    }
  ]
}
EOF

EXTERNAL_IP=${INSTANCES_IP[$i]}

INTERNAL_IP=${INSTANCES_IP[$i]}

cfssl gencert \
  -ca=ca.pem \
  -ca-key=ca-key.pem \
  -config=ca-config.json \
  -hostname=${INSTANCES[$i]},${INTERNAL_IP} \
  -profile=kubernetes \
  ${INSTANCES[$i]}-csr.json | cfssljson -bare ${INSTANCES[$i]}
done
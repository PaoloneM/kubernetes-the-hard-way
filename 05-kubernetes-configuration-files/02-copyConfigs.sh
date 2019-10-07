for instance in worker-0 worker-1; do
  vagrant scp ../05-kubernetes-configuration-files/${instance}.kubeconfig ${instance}:~/
  vagrant scp ../05-kubernetes-configuration-files/kube-proxy.kubeconfig ${instance}:~/
done

for instance in controller-0 controller-1; do
  vagrant scp ../05-kubernetes-configuration-files/admin.kubeconfig ${instance}:~/ 
  vagrant scp ../05-kubernetes-configuration-files/kube-controller-manager.kubeconfig ${instance}:~/
  vagrant scp ../05-kubernetes-configuration-files/kube-scheduler.kubeconfig ${instance}:~/
done
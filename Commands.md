# Kubernetes Commands

## 🔹 Cluster Info
```bash
kubectl version --short
kubectl cluster-info
kubectl get componentstatuses
kubectl get nodes -o wide
```

## 🔹 Namespaces
```bash
kubectl get ns
kubectl create ns <namespace>
kubectl delete ns <namespace>
kubectl config set-context --current --namespace=<namespace>
```

## 🔹 Pods
```bash
kubectl get pods
kubectl get pods -o wide
kubectl describe pod <pod-name>
kubectl logs <pod-name>
kubectl exec -it <pod-name> -- /bin/bash
kubectl delete pod <pod-name>
```

## 🔹 Deployments
```bash
kubectl get deploy
kubectl describe deploy <deployment-name>
kubectl scale deploy <deployment-name> --replicas=3
kubectl rollout status deploy <deployment-name>
kubectl rollout undo deploy <deployment-name>
kubectl delete deploy <deployment-name>
```

## 🔹 Services
```bash
kubectl get svc
kubectl describe svc <service-name>
kubectl expose deploy <deployment-name> --type=NodePort --port=80 --target-port=8080
kubectl delete svc <service-name>
```

## 🔹 ConfigMaps & Secrets
```bash
kubectl get configmap
kubectl describe configmap <configmap-name>
kubectl create configmap my-config --from-literal=key1=value1 --from-literal=key2=value2
kubectl get secret
kubectl describe secret <secret-name>
kubectl create secret generic my-secret --from-literal=username=admin --from-literal=password=pass123
```

## 🔹 Nodes & Resources
```bash
kubectl top node
kubectl top pod
kubectl describe node <node-name>
```

## 🔹 Apply & Delete Manifests
```bash
kubectl apply -f <file.yaml>
kubectl delete -f <file.yaml>
kubectl get all
```

## 🔹 Context & Config
```bash
kubectl config get-contexts
kubectl config use-context <context-name>
kubectl config view --minify | grep namespace:
```

## 🔹 Useful Shortcuts
```bash
# Get everything in the namespace
kubectl get all -n <namespace>

# Run temporary pod
kubectl run tmp-shell --rm -i --tty --image busybox -- /bin/sh
```

---
✅ Keep this handy while working with Kubernetes! And feel free to add more!

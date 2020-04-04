kubectl -n kube-system delete -f ./yaml
kubectl -n kube-system delete secret triggercmd-token
kubectl -n kube-system delete secret triggercmd-commands
kubectl -n kube-system delete secret triggercmd-scripts

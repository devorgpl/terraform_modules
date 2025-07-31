logs (openobserve)
metrics (prometheus/grafana)
istio (+ plugins)

# Prometheus

Issues with mount "/"
```
kubectl patch ds monitoring-prometheus-node-exporter --type "json" -p '[{"op": "remove", "path" : "/spec/template/spec/containers/0/volumeMounts/2/mountPropagation"}]'
```
or 

```
helm install prom prometheus-community/kube-prometheus-stack --set prometheus-node-exporter.hostRootFsMount.enabled=false
```

# Istio
```
helm repo add istio https://istio-release.storage.googleapis.com/charts
helm repo update
```

Base components
```
helm install istio-base istio/base -n istio-system --create-namespace --wait
```

Control plane
```
helm install istiod istio/istiod --namespace istio-system --set profile=ambient --wait
```

CNI node agent
```
helm install istio-cni istio/cni -n istio-system --set profile=ambient --wait
```

DataPlane ztunnel daemon set
```
helm install ztunnel istio/ztunnel -n istio-system --wait
```
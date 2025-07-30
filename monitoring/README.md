logs (openobserve)
metrics (prometheus/graphana)
istio (+ plugins)

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
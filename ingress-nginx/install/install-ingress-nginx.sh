#/bin/bash

# Install Ingress-NGINX, Inject Dapr Sidecar
helm upgrade --install ingress-nginx ingress-nginx \
  -f dapr-injection.yaml \
  --repo https://kubernetes.github.io/ingress-nginx
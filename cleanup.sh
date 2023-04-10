#bin/bash

#     ____ _                              
#    / ___| | ___  __ _ _ __  _   _ _ __  
#   | |   | |/ _ \/ _` | '_ \| | | | '_ \ 
#   | |___| |  __/ (_| | | | | |_| | |_) |
#    \____|_|\___|\__,_|_| |_|\__,_| .__/ 
#                                  |_|    

# Delete Apis
kubectl delete -f ./apis

# Delete Dapr Components
kubectl delete -f ./dapr-components

# Delete Databases
kubectl delete -f ./dbs

# Delete Ingress
kubectl delete -f ./ingress

# Delete Tracing
kubectl delete -f ./tracing

# Delete Web App
kubectl delete -f ./web-app

# Delete Secrets
kubectl delete secret tls-secret
rm *.crt *.key
kubectl delete -f ./secrets

# Uninstall Dapr
dapr uninstall -k

# Delete Namespaces
kubectl delete ns dapr-system
kubectl delete ns ingress-nginx
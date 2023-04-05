#bin/bash

#    ____                   
#   |  _ \  __ _ _ __  _ __ 
#   | | | |/ _` | '_ \| '__|
#   | |_| | (_| | |_) | |   
#   |____/ \__,_| .__/|_|   
#               |_|         

# Init Dapr on Kubernetes (15min wait time max)
dapr init -k --wait --timeout 900

# Deploy Tracing
kubectl apply -f ./tracing

# Deploy Dapr Components
kubectl apply -f ./dapr-components

# Wait for changes
./wait-for-changes.sh

#    ____                     _       
#   / ___|  ___  ___ _ __ ___| |_ ___ 
#   \___ \ / _ \/ __| '__/ _ \ __/ __|
#    ___) |  __/ (__| | |  __/ |_\__ \
#   |____/ \___|\___|_|  \___|\__|___/

# Create the TLS Certificate
./create-tls.sh

# Apply the Secrets folder
kubectl apply -f ./secrets

#    ____        _        _                         
#   |  _ \  __ _| |_ __ _| |__   __ _ ___  ___  ___ 
#   | | | |/ _` | __/ _` | '_ \ / _` / __|/ _ \/ __|
#   | |_| | (_| | || (_| | |_) | (_| \__ \  __/\__ \
#   |____/ \__,_|\__\__,_|_.__/ \__,_|___/\___||___/                                              

# Deploy Databases
kubectl apply -f ./dbs

# Wait for changes
./wait-for-changes.sh

#       _    ____ ___     
#      / \  |  _ \_ _|___ 
#     / _ \ | |_) | |/ __|
#    / ___ \|  __/| |\__ \
#   /_/   \_\_|  |___|___/   

# Deploy Apis
kubectl apply -f ./apis

# Wait for changes
./wait-for-changes.sh

#   __        __   _          _                
#   \ \      / /__| |__      / \   _ __  _ __  
#    \ \ /\ / / _ \ '_ \    / _ \ | '_ \| '_ \ 
#     \ V  V /  __/ |_) |  / ___ \| |_) | |_) |
#      \_/\_/ \___|_.__/  /_/   \_\ .__/| .__/ 
#                                 |_|   |_|    

# Deploy Web App
kubectl apply -f ./web-app

# Wait for changes
./wait-for-changes.sh

#    ___                               
#   |_ _|_ __   __ _ _ __ ___  ___ ___ 
#    | || '_ \ / _` | '__/ _ \/ __/ __|
#    | || | | | (_| | | |  __/\__ \__ \
#   |___|_| |_|\__, |_|  \___||___/___/
#              |___/                    

# Install Ingress-Nginx, Inject Dapr Sidecar
helm upgrade --install ingress-nginx ingress-nginx \
  --repo https://kubernetes.github.io/ingress-nginx \
  -f ingress-dapr-injection.yaml \
  --wait

# Apply Ingress-Nginx Configuration
kubectl apply -f ./ingress/

# Wait for changes
./wait-for-changes.sh

#    _____ _       _     _              _ _ 
#   |  ___(_)_ __ (_)___| |__   ___  __| | |
#   | |_  | | '_ \| / __| '_ \ / _ \/ _` | |
#   |  _| | | | | | \__ \ | | |  __/ (_| |_|
#   |_|   |_|_| |_|_|___/_| |_|\___|\__,_(_)
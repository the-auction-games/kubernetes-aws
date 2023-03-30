# Kubernetes Deployment
This repository provides the configuration to deploy TheAuctionGames to a Kubernetes cluster.  

## Deployment
Please execute the `setup.sh` script to deploy the application to your cluster.  
Please note that the deployment does require a Kubernetes cluster and Helm to be installed.  

## Ingress
The ingress is configured to use the domain `the-auction-games.com`.  
The Web Application is available under `http://the-auction-games.com`.  
The API is available under `http://api.the-auction-games.com`.  
Tracing (with Zipkin) is available under `http://tracing.the-auction-games.com`.  

## Cleanup
Please execute the `cleanup.sh` script to remove all deployments from your cluster.  
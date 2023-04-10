# Kubernetes Deployment
This repository provides the configuration to deploy TheAuctionGames to a Kubernetes cluster.  

## Configure Kubectl for AWS EKS
Execute:  
```bash
aws eks update-kubeconfig --region <region-code> --name <my-cluster>
```

## Setup AWS Prefix Assignment Mode
Execute:  
```bash
kubectl set env daemonset aws-node -n kube-system ENABLE_PREFIX_DELEGATION=true
kubectl describe daemonset -n kube-system aws-node | grep ENABLE_PREFIX_DELEGATION
```
See https://aws.amazon.com/blogs/containers/amazon-vpc-cni-increases-pods-per-node-limits/ for more details.  

## Deployment
Please execute the `setup.sh` script to deploy the application to your cluster.  
Please note that the deployment requires an AWS Cluster, AWS Node Group, and the Dapr CLI to be installed.  

## Ingress
The ingress is configured to use the domain `the-auction-games.com`.  
The Web Application is available under `http://the-auction-games.com`.  
The API is available under `http://api.the-auction-games.com`.  
Tracing (with Zipkin) is available under `http://tracing.the-auction-games.com`.  

## Cleanup
Please execute the `cleanup.sh` script to remove all deployments from your cluster.  
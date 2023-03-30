#bin/bash

# Bash script to wait for all deployments and pods to be ready.
# This prevents future commands from exeucting until all previous
# changes have been applied. (15 min wait time max)

# Wait for all deployments to be available
kubectl wait --for=condition=available deployment --all --timeout=900s

# Wait for all pods to be ready
kubectl wait --for=condition=ready pod --all --timeout=900s

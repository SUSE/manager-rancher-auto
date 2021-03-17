#!/bin/bash
# Create imported Cluster
TOKEN={token-RancherAPIToken}
CLUSTER_ID=$(curl -k https://rancher.susedojo.com/v3/clusters \
  -H "content-type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  --data-binary '{
    "type": "cluster",
    "importedConfig": {
    },
    "name": "slb-k3s"
  }' | jq -r .id)
echo $CLUSTER_ID
  
# Register Cluster to Rancher
k3sregister() {
CLUSTER_CONNECT=$(curl -k https://rancher.susedojo.com/v3/clusterregistrationtoken \
  -H "content-type: application/json" \
  -H "Authorization: Bearer $TOKEN" \
  --data-binary '{
    "type": "clusterRegistrationToken",
    "clusterId": "'$CLUSTER_ID'"
  }' | jq -r .insecureCommand)
#echo $CLUSTER_CONNECT
eval "$CLUSTER_CONNECT"
}

# Register cluster
k3sregister

touch /tmp/rancher-registered
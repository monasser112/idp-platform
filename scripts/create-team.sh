#!/bin/bash
set -e

TEAM_NAME=$1

if [ -z "$TEAM_NAME" ]; then
  echo "Usage: ./create-team.sh <team-name>"
  echo "Example: ./create-team.sh team-alpha"
  exit 1
fi

echo "🚀 Creating namespace for team: $TEAM_NAME"

# Create temporary directory
mkdir -p temp-$TEAM_NAME

# Copy template
cp ../tenant-templates/namespace-template/namespace.yaml temp-$TEAM_NAME/

# Replace TEAM_NAME placeholder
sed "s/TEAM_NAME/$TEAM_NAME/g" temp-$TEAM_NAME/namespace.yaml > temp-$TEAM_NAME/final.yaml

# Apply to cluster
kubectl apply -f temp-$TEAM_NAME/final.yaml

# Clean up
rm -rf temp-$TEAM_NAME

echo "✅ Team namespace created: $TEAM_NAME"
echo ""
echo "Verify with: kubectl get namespace $TEAM_NAME"
echo "View resources: kubectl get all -n $TEAM_NAME"
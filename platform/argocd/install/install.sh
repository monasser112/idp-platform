#!/bin/bash
set -e

echo "🚀 Installing ArgoCD..."

# Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

echo "⏳ Waiting for ArgoCD to be ready (this takes 2-3 minutes)..."
kubectl wait --for=condition=available --timeout=600s \
  deployment/argocd-server -n argocd

echo ""
echo "✅ ArgoCD installed successfully!"
echo ""
echo "🔑 ArgoCD Admin Password:"
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d
echo ""
echo ""
echo "📝 To access ArgoCD UI, run this command in another terminal:"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443"
echo ""
echo "Then open: https://localhost:8080"
echo "Username: admin"
echo "Password: (shown above)"
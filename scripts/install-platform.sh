#!/bin/bash
set -e

echo "🏗️  Installing IDP Platform Components..."
echo ""

# Install ArgoCD
echo "1️⃣  Installing ArgoCD..."
cd ../platform/argocd/install
bash install.sh

echo ""
echo "✅ Platform installation complete!"
echo ""
echo "📚 Next Steps:"
echo "1. Access ArgoCD: kubectl port-forward svc/argocd-server -n argocd 8080:443"
echo "2. Login with credentials shown above"
echo "3. Connect your GitHub repo to ArgoCD"
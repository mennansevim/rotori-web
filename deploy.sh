#!/usr/bin/env bash
# Rotori-web deploy — Pi'de bir defalık kurulumdan sonra tek komutluk güncelleme.
# Kullanım (Pi'de, ~/rotori-web içinde):
#   ./deploy.sh
set -euo pipefail

cd "$(dirname "$0")"

echo "→ git pull"
git pull --ff-only

echo "→ docker compose up -d --build"
docker compose up -d --build

echo "→ container durumu"
docker compose ps

echo ""
echo "✓ Deploy tamam. Test:"
echo "  curl -I http://localhost:3080"
echo "  curl -I https://rotori.app"

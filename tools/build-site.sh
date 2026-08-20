#!/bin/sh

set -eu

ROOT=$(CDPATH= cd -- "$(dirname "$0")/.." && pwd)
DIST="$ROOT/dist"
CLIENT="$DIST/client"
SOCIAL_CARD="$ROOT/assets/media/social/morph-social-card.png"

rm -rf "$DIST"
mkdir -p "$CLIENT" "$DIST/server"

for file in _headers 404.html index.html privacy.html icon.png robots.txt \
  site.webmanifest sitemap.xml; do
  cp "$ROOT/$file" "$CLIENT/$file"
done

mkdir -p "$CLIENT/assets/styles" "$CLIENT/assets/scripts"

for file in brand.css markdown.css product-continuation.css; do
  cp "$ROOT/assets/styles/$file" "$CLIENT/assets/styles/$file"
done

for file in document-navigation.js product-continuation.js site-motion.js; do
  cp "$ROOT/assets/scripts/$file" "$CLIENT/assets/scripts/$file"
done

if [ -f "$SOCIAL_CARD" ]; then
  mkdir -p "$CLIENT/assets/media/social"
  cp "$SOCIAL_CARD" "$CLIENT/assets/media/social/morph-social-card.png"
fi

cp "$ROOT/tools/sites-static-worker.js" "$DIST/server/index.js"

printf 'Built static Morph site in %s\n' "$DIST"

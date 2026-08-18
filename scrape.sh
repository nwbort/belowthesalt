#!/bin/bash
set -euo pipefail

URL='https://tiny-kingdom-music.myshopify.com/products/haley-blais-below-the-salt-12-vinyl.js'
STATUS_FILE='status.json'

TMP=$(mktemp)
trap 'rm -f "$TMP"' EXIT

curl -s -L "$URL" -o "$TMP"

jq '{available, price, title, description}' "$TMP" > "$STATUS_FILE"

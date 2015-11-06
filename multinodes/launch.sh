#!/usr/bin/env sh
MARATHON=http://172.31.3.11:8080

for file in nginx.json
do
  echo "Installing $file..."
  curl -X POST "$MARATHON/v2/apps" -d @"$file" -H "Content-type: application/json"
  echo ""
done
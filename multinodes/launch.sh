#!/usr/bin/env sh

MARATHON=http://ec2-52-31-124-11.eu-west-1.compute.amazonaws.com:8080

for file in nginx.json
do
  echo "Installing $file..."
  curl -X POST "$MARATHON/v2/apps" -d @"$file" -H "Content-type: application/json"
  echo ""
done
#!/usr/bin/env bash
if [ -z "$1" ]; then
  echo "Usage: ./verify.sh <domain>   e.g. ./verify.sh fpp-sable.vercel.app"
  exit 1
fi
D=$1
echo "== Checking root = http://$D/ (HEAD)"
curl -I -s https://$D/ | sed -n '1,200p'
echo
echo "== Checking root = https://$D/ (GET first 200 chars)"
curl -s https://$D/ | sed -n '1,200p'
echo
echo "== Checking manifest = https://$D/.well-known/farcaster.json (HEAD)"
curl -I -s https://$D/.well-known/farcaster.json | sed -n '1,200p'
echo
echo "== Checking manifest content (first 200 chars)"
curl -s https://$D/.well-known/farcaster.json | sed -n '1,200p'

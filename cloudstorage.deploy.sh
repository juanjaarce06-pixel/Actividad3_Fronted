#!/usr/bin/env bash
set -euo pipefail
BUCKET=ml-image-frontend
PROJ=$(gcloud config get-value project)
gsutil mb -l us-central1 gs://$BUCKET || true
gsutil web set -m public/index.html -e public/index.html gs://$BUCKET
gsutil -m rsync -r public gs://$BUCKET
gsutil iam ch allUsers:objectViewer gs://$BUCKET
echo "URL: https://storage.googleapis.com/${BUCKET}/index.html"

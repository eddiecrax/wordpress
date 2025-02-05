#!/bin/bash

# Install Google Cloud SDK
echo "Installing Google Cloud SDK..."
apt-get update && apt-get install -y curl
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-409.0.0-linux-x86_64.tar.gz
tar -xzf google-cloud-sdk-409.0.0-linux-x86_64.tar.gz
./google-cloud-sdk/install.sh --quiet
export PATH=$PATH:$(pwd)/google-cloud-sdk/bin

# Authenticate with Google Cloud
echo "Authenticating with Google Cloud..."
gcloud auth activate-service-account --key-file=$GOOGLE_APPLICATION_CREDENTIALS

# Upload files to Google Cloud Storage
echo "Uploading files to Google Cloud Storage..."
gsutil cp index.html gs://forthbrand-website-bucket/
gsutil cp styles.css gs://forthbrand-website-bucket/
gsutil cp script.js gs://forthbrand-website-bucket/

# Make files publicly accessible
echo "Making files publicly accessible..."
gsutil acl ch -u AllUsers:R gs://forthbrand-website-bucket/index.html
gsutil acl ch -u AllUsers:R gs://forthbrand-website-bucket/styles.css
gsutil acl ch -u AllUsers:R gs://forthbrand-website-bucket/script.js

echo "Deployment complete!"

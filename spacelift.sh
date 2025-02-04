#!/bin/bash

# Upload files to Google Cloud Storage
gsutil cp index.html gs://forthbrand-website-bucket/
gsutil cp styles.css gs://forthbrand-website-bucket/
gsutil cp script.js gs://forthbrand-website-bucket/

# Make files publicly accessible
gsutil acl ch -u AllUsers:R gs://forthbrand-website-bucket/index.html
gsutil acl ch -u AllUsers:R gs://forthbrand-website-bucket/styles.css
gsutil acl ch -u AllUsers:R gs://forthbrand-website-bucket/script.js

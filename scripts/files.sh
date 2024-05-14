#!/bin/bash

# Set your AWS region
AWS_REGION="us-east-1"

# Set your S3 bucket name and folder
S3_BUCKET="jensk-1"
S3_FOLDER="build.zip"

# Set the destination directory
DESTINATION_DIR="/var/www/html"

# Copy files from S3 to destination directory
aws s3 sync s3://$S3_BUCKET/$S3_FOLDER $DESTINATION_DIR

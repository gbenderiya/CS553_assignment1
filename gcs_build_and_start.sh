#!/bin/bash

SERVICE_NAME="cs553app"
IMAGE="gbenderiya/cs553_assignment1:latest"
PORT=7860
REGION="us-east1"

# Build the container
docker build -t gbenderiya/cs553_assignment1 . 

# Push the container to docker hub
docker push gbenderiya/cs553_assignment1

# Deploy to Cloud Run
gcloud run deploy $SERVICE_NAME \
  --image $IMAGE \
  --region $REGION \
  --platform managed \
  --allow-unauthenticated \
  --port $PORT

# Output service URL
SERVICE_URL=$(gcloud run services describe $SERVICE_NAME --region $REGION --format='value(status.url)')
echo "Service deployed successfully! URL: $SERVICE_URL"

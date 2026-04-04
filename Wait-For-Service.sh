#!/usr/bin/env bash
echo "Waiting for service on port 8080 to be ready.."
#-s (slient)
#-f (fail fast, don't output error)
until curl -s -f http://localhost:8080/health; do
        echo "Service is not ready yest. Retrying in 5 seconds.."
        sleep 5
done    
echo "SERVICE IS READY! Continue deployment..."

#!/bin/bash

# Build script for static website Docker image

echo "Building static website Docker image..."

# Build the image
docker build -t static-website:latest .

if [ $? -eq 0 ]; then
    echo "✅ Build successful!"
    echo ""
    echo "To test locally:"
    echo "  docker run -p 8080:80 static-website:latest"
    echo ""
    echo "To deploy to Docker Swarm:"
    echo "  docker stack deploy -c docker-compose.yml static-website"
    echo ""
    echo "To view in Portainer:"
    echo "  1. Go to Stacks in Portainer"
    echo "  2. Add stack with docker-compose.yml content"
    echo "  3. Deploy the stack"
else
    echo "❌ Build failed!"
    exit 1
fi

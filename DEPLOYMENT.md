# Static Website Deployment Guide

This guide explains how to deploy your static website using Docker Swarm and Portainer.

## Prerequisites

- Docker Swarm initialized on your target machine
- Portainer installed and accessible
- All project files uploaded to the target machine

## Deployment Steps

### 1. Upload Your Code

**Option A: Direct Upload to Target Machine**
- Copy all project files to the target machine's directory
- Ensure the directory structure matches:
  ```
  /path/to/website/
  ├── index.html
  ├── css/
  │   └── style.css
  ├── js/
  │   └── script.js
  ├── Dockerfile
  ├── nginx.conf
  ├── docker-compose.yml
  └── .dockerignore
  ```

**Option B: Git Clone on Target Machine**
```bash
git clone <your-repository-url>
cd <repository-name>
```

### 2. Deploy via Portainer

1. **Access Portainer**
   - Open Portainer in your browser
   - Navigate to "Stacks" in the left sidebar

2. **Create New Stack**
   - Click "Add stack"
   - Give your stack a name (e.g., "static-website")
   - Copy the contents of `docker-compose.yml` into the web editor

3. **Deploy the Stack**
   - Click "Deploy the stack"
   - Wait for the deployment to complete

### 3. Alternative: Command Line Deployment

If you prefer command line deployment:

```bash
# Navigate to your project directory
cd /path/to/website

# Deploy the stack
docker stack deploy -c docker-compose.yml static-website

# Check stack status
docker stack ls
docker stack services static-website
```

### 4. Verify Deployment

1. **Check Service Status**
   - In Portainer: Go to "Services" → Look for "static-website_website"
   - Status should show "Running"

2. **Access Your Website**
   - Open your browser and navigate to `http://your-server-ip:80`
   - You should see your website

3. **Check Logs**
   - In Portainer: Go to "Services" → Click on your service → "Logs"
   - Look for any errors or successful startup messages

## Configuration Options

### Port Configuration
To change the port, modify the `docker-compose.yml`:
```yaml
ports:
  - "8080:80"  # Maps host port 8080 to container port 80
```

### Scaling
To scale your service, modify the replicas in `docker-compose.yml`:
```yaml
deploy:
  replicas: 3  # Run 3 instances
```

### Resource Limits
Adjust CPU and memory limits as needed:
```yaml
resources:
  limits:
    cpus: '1.0'      # 1 CPU core
    memory: 1G       # 1GB RAM
```

## Troubleshooting

### Common Issues

1. **Port Already in Use**
   - Change the host port in `docker-compose.yml`
   - Or stop the service using the port

2. **Build Failures**
   - Check that all files are present
   - Verify Dockerfile syntax
   - Check Portainer logs for build errors

3. **Service Won't Start**
   - Check resource availability
   - Verify nginx.conf syntax
   - Check container logs

### Useful Commands

```bash
# View stack services
docker stack services static-website

# View service logs
docker service logs static-website_website

# Scale service
docker service scale static-website_website=3

# Remove stack
docker stack rm static-website

# Force update
docker service update --force static-website_website
```

## Security Considerations

- The Dockerfile runs Nginx as a non-root user
- Security headers are configured in nginx.conf
- Hidden files are blocked from access
- Gzip compression is enabled for performance

## Performance Tips

- Static assets (CSS, JS, images) are cached for 1 year
- HTML files are not cached for easy updates
- Gzip compression reduces bandwidth usage
- Health checks ensure service availability

## Updating Your Website

1. **Update Files**
   - Modify your HTML, CSS, or JavaScript files
   - Upload the changes to the target machine

2. **Rebuild and Deploy**
   - In Portainer: Go to your stack
   - Click "Update the stack"
   - The service will rebuild with your changes

## Monitoring

- Use Portainer's built-in monitoring
- Check service health status
- Monitor resource usage
- Review access and error logs

## Backup

Consider backing up your:
- Source code
- Docker images
- Configuration files
- Database (if applicable)

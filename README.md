# Static Website with Docker & Nginx

A modern, responsive static website served by Nginx in Docker, optimized for Docker Swarm deployment through Portainer.

## 🚀 Features

- **Responsive Design**: Mobile-first CSS with modern gradients and animations
- **Interactive Navigation**: Smooth scrolling and active state management
- **Docker Optimized**: Multi-stage build with security best practices
- **Swarm Ready**: Docker Compose v3.8 compatible with Docker Swarm
- **Portainer Integration**: Easy deployment through Portainer's web interface
- **Performance Optimized**: Gzip compression, caching, and security headers

## 📁 Project Structure

```
.
├── index.html          # Main HTML file
├── css/
│   └── style.css      # Responsive CSS styles
├── js/
│   └── script.js      # Interactive JavaScript
├── Dockerfile          # Docker image definition
├── nginx.conf          # Nginx configuration
├── docker-compose.yml  # Docker Swarm deployment
├── .dockerignore       # Docker build exclusions
├── build.sh            # Local build script
├── DEPLOYMENT.md       # Detailed deployment guide
└── README.md           # This file
```

## 🛠️ Quick Start

### Local Development

1. **Clone or download** this project to your local machine
2. **Customize** the HTML, CSS, and JavaScript files as needed
3. **Test locally** using the build script:
   ```bash
   chmod +x build.sh
   ./build.sh
   ```

### Docker Swarm Deployment

1. **Upload all files** to your target machine (where Docker Swarm is running)
2. **Access Portainer** in your browser
3. **Create a new stack** and paste the contents of `docker-compose.yml`
4. **Deploy the stack** and wait for completion
5. **Access your website** at `http://your-server-ip:80`

## 🔧 Configuration

### Port Configuration
Change the port in `docker-compose.yml`:
```yaml
ports:
  - "8080:80"  # Maps host port 8080 to container port 80
```

### Scaling
Adjust the number of replicas:
```yaml
deploy:
  replicas: 3  # Run 3 instances
```

### Resource Limits
Modify CPU and memory limits:
```yaml
resources:
  limits:
    cpus: '1.0'
    memory: 1G
```

## 📱 Responsive Features

- Mobile-first CSS design
- Smooth scrolling navigation
- Interactive hover effects
- Optimized for all screen sizes
- Modern gradient backgrounds

## 🔒 Security Features

- Non-root user execution
- Security headers (XSS protection, frame options)
- Hidden file access prevention
- Content Security Policy
- Input sanitization

## 📊 Performance Features

- Gzip compression enabled
- Static asset caching (1 year for CSS/JS, no cache for HTML)
- Optimized Nginx configuration
- Health checks for service monitoring
- Resource limits and reservations

## 🚀 Deployment Options

### Option 1: Portainer (Recommended)
- Web-based deployment
- Easy monitoring and management
- Visual service status
- Built-in logging

### Option 2: Command Line
```bash
docker stack deploy -c docker-compose.yml static-website
```

### Option 3: Docker Compose (Standalone)
```bash
docker-compose up -d
```

## 📝 Updating Your Website

1. **Modify** your HTML, CSS, or JavaScript files
2. **Upload** changes to the target machine
3. **Update** the stack in Portainer
4. **Redeploy** to apply changes

## 🐛 Troubleshooting

- **Build failures**: Check file paths and Dockerfile syntax
- **Service won't start**: Verify resource availability and port conflicts
- **Website not accessible**: Check firewall settings and port mapping
- **Performance issues**: Monitor resource usage and adjust limits

## 📚 Additional Resources

- [Docker Swarm Documentation](https://docs.docker.com/engine/swarm/)
- [Portainer Documentation](https://docs.portainer.io/)
- [Nginx Configuration Guide](https://nginx.org/en/docs/)
- [Docker Best Practices](https://docs.docker.com/develop/dev-best-practices/)

## 🤝 Contributing

Feel free to submit issues, feature requests, or pull requests to improve this project.

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

**Happy Deploying! 🎉**

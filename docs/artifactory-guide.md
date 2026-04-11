# Artifactory at MicroBank

## Repository Types
- **Local Repository**: Where we store our own built artifacts (Docker images, JARs)
  - Example: 'microbank-docker-local' for our Docker images
  - Example: 'microbank-maven-local' for our JAVA JARs

- **Remote Repository**: A cached proxy of external repositories
  - Example: 'docker-hub-remote' caches images from Docker Hub
  - Example: 'maven-central-remote' caches Java libraries from Maven Central
  - Benefit: faster builds (cached locally) + works even if external repo is down

- **Virtual Repository**: Combines local + remote into one URL
  - Example: 'docker-virtual' = 'microbank-docker-local' + 'docker-hub-remote'
  - Developers use one URL; Artifactory decides where to find the artifact

## Image Promotion Flow
Build -> microbank/nginx:dev (local repo, dev tag) -> (QA approval) microbank/nginx:sit (promoted, retag) -> (UAT approval) microbank/nginx:uat (promoted, retag) -> (Release Manager approval) microbank/nginx:prod (promoted, retag)


## Cleanup Policies
- Keep last 5 versions of each image per environment
- Delete images older than 90 days from dev
- Never auto-delete production images

## Security Scanning
- All images scanned with Trivy/Xray before promotion
- CRITICAL vulnerabilities block promotion
- HIGH vulnerabilities require security team approval

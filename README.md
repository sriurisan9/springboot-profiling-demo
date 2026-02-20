# Springboot Profiling Demo

This repository contains a small Spring Boot application that demonstrates environment-based profiling
(dev, prod) and how to package and deploy the app using Docker, Kubernetes, AWS/EKS, and Helm.

## What you get
- `application.properties`, `application-dev.properties`, `application-prod.properties`
- Profile-specific beans (`@Profile("dev")` and `@Profile("prod")`)
- Dockerfile
- Kubernetes deployment YAML (`k8s-deploy.yaml`)
- AWS/EKS-specific deployment manifest (`k8s-eks-deploy.yaml`)
- Helm chart in `helm/profiling-demo`
- GitHub Actions workflow for CI/CD

## Quick start (local)
Build the jar:
```bash
mvn -B clean package
```

Run with dev profile:
```bash
mvn spring-boot:run -Dspring-boot.run.profiles=dev
# or
java -jar target/profiling-demo-0.1.0.jar --spring.profiles.active=dev
```

Test:
```
curl http://localhost:8080/message
```

## Docker
Build image:
```bash
docker build -t your-docker-repo/profiling-demo:0.1.0 .
```

Run dev:
```bash
docker run -e SPRING_PROFILES_ACTIVE=dev -p 8080:8080 your-docker-repo/profiling-demo:0.1.0
```

## Kubernetes (generic)
Update `image` in `k8s-deploy.yaml` to your registry and apply:
```bash
kubectl apply -f k8s-deploy.yaml
```

## AWS / EKS
See `k8s-eks-deploy.yaml` for recommended EKS deployment (uses service account and IAM roles for service accounts if needed).
Replace image and secrets with your values.

## Helm
Install the chart:
```bash
helm repo add local-charts https://example.com/charts  # optional
helm install profiling-demo helm/profiling-demo --set image.repository=your-docker-repo/profiling-demo --set image.tag=0.1.0
```

## GitHub Actions CI/CD
The workflow builds the JAR, builds and pushes Docker image (requires registry secrets), and deploys to the cluster using `kubectl` (requires KUBECONFIG secret).

## License
MIT

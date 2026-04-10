# OpenShift vs Kubernetes - Comparison for MicroBank

## What is OpenShift?
OpenShift is Red Hat's enterprise Kubernetes platform. It adds:
- Stricter security defaults
- Built-in CI/CD
- Better web console
- Enterprise support

## Key Differences

### 1. Access Control
**Kubernetes:** Uses RBAC (Role-Based Access Control). Flexible but requires manual setup.
**OpenShift:** Uses SCCs (Security Context Constraints) in addition to RBAC.
By default, containers cannot run as root. Our Dockerfiles already use non-root users, so they're OpenShift-compatible.

### 2. External Access
**Kubernetes Ingress:**
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: microbank-ingress
spec:
  rules:
    - host: microbank.example.com
      http:
        paths:
          - path: /api/accounts
            pathType: Prefix
            backend:
              service:
                name: account-service
                port:
                  number: 8080
```
**OpenShift Route:**
kind: Route
metadata:
  name: microbank-route
spec:
  host: microbank.example.com
  to:
    kind: Service
    name: account-service
  port:
    targetPort: 8080
  tls:
    termination: edge

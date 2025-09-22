# Kubernetes Project: NGINX & MongoDB Stack

This project contains Kubernetes manifests to deploy an NGINX web server, a MongoDB database, and a Mongo Express UI.

## Structure

- **deployment/**
  - `nginx-deployment.yaml`: Deploys NGINX pods.
- **services/**
  - `nginx-service.yaml`: Exposes NGINX via a ClusterIP service.
- **Mongo-proj/**
  - `mongo.yaml`: Deploys MongoDB and its service.
  - `mongo-express.yaml`: Deploys Mongo Express and its service.
  - `mongo-configmap.yaml`: ConfigMap for MongoDB connection.
  - `secret.yaml`: Secret for MongoDB credentials.

## Usage

1. **Apply MongoDB resources:**
   ```
   kubectl apply -f Mongo-proj/secret.yaml
   kubectl apply -f Mongo-proj/mongo-configmap.yaml
   kubectl apply -f Mongo-proj/mongo.yaml
   ```

2. **Apply Mongo Express:**
   ```
   kubectl apply -f Mongo-proj/mongo-express.yaml
   ```

3. **Apply NGINX deployment and service:**
   ```
   kubectl apply -f deployment/nginx-deployment.yaml
   kubectl apply -f services/nginx-service.yaml
   ```

## Access

- **NGINX:** Exposed via `nginx-service` on port 80.
- **Mongo Express:** Exposed via `mongo-express-service` on port 30000 (NodePort).

## Notes

- MongoDB credentials are stored as base64-encoded secrets.
- Mongo Express connects to MongoDB using the provided ConfigMap and secrets.

##
Helm charts
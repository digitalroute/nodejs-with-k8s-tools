# nodejs-with-k8s-tools

Nodejs base image with Kubernetes tools

# Base Image


node:14-buster
- https://hub.docker.com/_/node


# Tools included

- AWS cli v2
- AWS aws-iam-authenticator
- Helm3
- Helmfile
- Kubectl

# Building Image

Manually build for local testing

- docker build -t nodejs-with-k8s-tools .

Manually push to DigitalRoute Docker Hub

- docker login
- docker build -t digitalroute/nodejs-with-k8s-tools:<version> .
- docker push digitalroute/nodejs-with-k8s-tools:<version>

# Run Image

- docker run -it --rm --privileged digitalroute/nodejs-with-k8s-tools:<version> bash

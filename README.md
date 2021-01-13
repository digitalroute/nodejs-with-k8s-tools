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

## Docker Hub

- Credentials are stored on Lastpass for the id: **digitalroutedevops** with the email **devops@digitalroute.com**

## Manual

```bash
Manually build for local testing

- docker build -t nodejs-with-k8s-tools .

Manually push to Docker Hub

- docker login
- docker build -t digitalroutedevops/nodejs-with-k8s-tools:<version> .
- docker push digitalroutedevops/nodejs-with-k8s-tools:<version>
```

## Automated build

```bash
The automated build are configured in Docker Hub.
You need to only tag the release and the image will be build base on the version you tag.

- Make sure your changes are in master
- docker tag x.y.z
- docker push origin --tags

You can check the build status on Docker Hub
https://hub.docker.com/repository/docker/digitalroutedevops/nodejs-with-k8s-tools/builds


```

# Run Image

- docker run -it --rm --privileged digitalroutedevops/nodejs-with-k8s-tools:<version> bash

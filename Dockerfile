FROM node:14-buster

LABEL version="1.0.0"

USER root

RUN cd /tmp && \
    echo "Install helm 3" && \
    wget -q https://get.helm.sh/helm-v3.4.2-linux-amd64.tar.gz && \
    tar -xvzf helm-v3.4.2-linux-amd64.tar.gz && \
    chmod 777 ./linux-amd64/helm && \
    mv ./linux-amd64/helm /usr/local/bin/helm && \
    rm -rf ./linux-amd64 && \
    rm -f helm*

RUN cd /tmp && \
    echo "Install helmfile" && \
    wget -q https://github.com/roboll/helmfile/releases/download/v0.137.0/helmfile_linux_amd64 && \
    chmod 777 ./helmfile_linux_amd64 && \
    mv ./helmfile_linux_amd64 /usr/local/bin/helmfile

RUN cd /tmp && \
    echo "Install aws cli" && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip -q awscliv2.zip && \
    ./aws/install && \
    echo "Install aws-iam-authenticator" && \
    curl -s -o aws-iam-authenticator https://amazon-eks.s3.us-west-2.amazonaws.com/1.17.9/2020-08-04/bin/linux/amd64/aws-iam-authenticator && \
    chmod 777 aws-iam-authenticator && \
    mv aws-iam-authenticator /usr/local/bin/ && \
    rm -rf /tmp/aws && \
    rm -f ./*.zip

RUN cd /tmp && \
    echo "Install kubectl" && \
    curl -s -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl" && \
    chmod 777 kubectl && \
    mv kubectl /usr/local/bin

RUN mkdir -p /root/.ssh && \
    chmod 777 /etc/passwd && \
    echo 'Host *\n    StrictHostKeyChecking no' > ~/.ssh/config && \
    chmod 600 -R /root/.ssh

WORKDIR /tmp

CMD ["/usr/bin/bash"]

FROM clojure:alpine

# Install AWS CLI, Docker client, Helm
RUN apk --no-cache update && \
    apk --no-cache add python py-pip py-setuptools ca-certificates groff less curl tar bash git openssh && \
    ## AWS CLI
    pip --no-cache-dir install awscli && \
    rm -rf /var/cache/apk/* && \
    ## Docker client
    curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.05.0-ce.tgz && \
    tar --strip-components=1 -xvzf docker-17.05.0-ce.tgz -C /usr/local/bin && \
    rm -rf docker-17.05.0-ce.tgz && \
    ## Helm
    curl -fsSLO https://storage.googleapis.com/kubernetes-helm/helm-v2.4.1-linux-amd64.tar.gz && \
    tar -xf helm-v2.4.1-linux-amd64.tar.gz && \
    mv linux-amd64/helm /usr/local/bin/helm && \
    rm -rf helm-v2.4.1-linux-amd64.tar.gz

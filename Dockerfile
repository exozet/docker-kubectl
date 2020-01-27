FROM alpine:3.10.3
RUN apk add --no-cache curl=7.66.0-r0
ARG KUBERNETES_VERSION=unknown
ENV KUBERNETES_VERSION $KUBERNETES_VERSION
RUN cd /usr/local/bin/ && wget https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl && chmod +x kubectl
CMD ["kubectl"]

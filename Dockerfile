FROM alpine:3.10.3
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN apk add --no-cache curl=7.66.0-r0
ARG KUBERNETES_VERSION=unknown
ENV KUBERNETES_VERSION $KUBERNETES_VERSION
RUN cd /usr/local/bin/ && wget https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl && chmod +x kubectl
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["kubectl"]

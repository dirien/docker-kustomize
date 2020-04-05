FROM alpine:3.8

ENV KUSTOMIZE_VERSION 3.5.4

RUN wget -O /usr/local/bin/kustomize https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz && \
  chmod +x /usr/local/bin/kustomize

RUN ln -s /kustomize /usr/local/bin/kustomize

ENTRYPOINT ["/kustomize"]
CMD ["--help"]

FROM alpine:3.8 as builder

ENV KUSTOMIZE_VERSION 3.8.1
WORKDIR /

RUN wget -qO- https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | tar xvz
RUN chmod +x kustomize

FROM alpine:3.8
COPY --from=builder /kustomize .
RUN ln -s /kustomize /usr/local/bin/kustomize

ENTRYPOINT ["/kustomize"]
CMD ["--help"]

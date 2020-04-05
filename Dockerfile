FROM alpine:3.8 as builder

ENV KUSTOMIZE_VERSION 3.5.4
WORKDIR /

RUN wget -O /bin/kustomize https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize%2Fv${KUSTOMIZE_VERSION}/kustomize_v${KUSTOMIZE_VERSION}_linux_amd64.tar.gz && \
  chmod +x /bin/kustomize

FROM alpine:3.8
COPY --from=builder /bin/kustomize .
RUN ln -s /kustomize /usr/local/bin/kustomize

ENTRYPOINT ["/kustomize"]
CMD ["--help"]

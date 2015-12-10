FROM alpine:3.2

ENV VAULT_VERSION=0.4.0
ENV VAULT_SHA256SUM=f56933cb7a445db89f8832016a862ca39b3e63dedb05709251e59d6bb40c56e8
RUN \
  apk add --update ca-certificates && \
  wget https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip && \
  echo "${VAULT_SHA256SUM}  vault_${VAULT_VERSION}_linux_amd64.zip" | sha256sum -c - && \
  unzip vault_${VAULT_VERSION}_linux_amd64.zip && \
  rm vault_${VAULT_VERSION}_linux_amd64.zip && \
  mv vault /usr/bin && \
  apk del ca-certificates

ENTRYPOINT ["vault"]
CMD ["server", "-dev"]
EXPOSE 8200

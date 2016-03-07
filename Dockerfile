FROM alpine:3.2

ENV VAULT_VERSION=0.5.1
ENV VAULT_SHA256SUM=7319b6514cb5ca735d9886d7b7e1ed8730ee38b238bb1626564436b824206d12
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

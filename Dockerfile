FROM busybox

ENV VAULT_VERSION=0.3.0
ENV VAULT_SHA256=30b8953e98059d1e8d97f6a164aa574a346a58caf9c5c74a911056f42fbef4d5
RUN \
  wget http://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip &&\
  echo "${VAULT_SHA256}  vault_${VAULT_VERSION}_linux_amd64.zip" | sha256sum -c - &&\
  unzip vault_${VAULT_VERSION}_linux_amd64.zip &&\
  rm vault_${VAULT_VERSION}_linux_amd64.zip &&\
  mv vault /usr/bin

ENTRYPOINT ["vault"]
CMD ["server", "-dev"]
EXPOSE 8200

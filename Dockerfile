FROM busybox

ENV VAULT_VERSION=0.3.1
ENV VAULT_SHA256SUM=4005f0ae1bd88ad2676859430209129ed13bc3ade6b64fcf40cc3a6d4d9469e7
RUN \
  wget http://dl.bintray.com/mitchellh/vault/vault_${VAULT_VERSION}_linux_amd64.zip &&\
  echo "${VAULT_SHA256SUM}  vault_${VAULT_VERSION}_linux_amd64.zip" | sha256sum -c - &&\
  unzip vault_${VAULT_VERSION}_linux_amd64.zip &&\
  rm vault_${VAULT_VERSION}_linux_amd64.zip &&\
  mv vault /usr/bin

ENTRYPOINT ["vault"]
CMD ["server", "-dev"]
EXPOSE 8200

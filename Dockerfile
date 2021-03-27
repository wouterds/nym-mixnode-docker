FROM rust:1-slim-buster AS builder
ARG NYM_VERSION=v0.9.2
WORKDIR /app
RUN set -ex \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y libssl-dev pkg-config git tini \
    && git clone https://github.com/nymtech/nym.git \
    && cd ./nym \
    && git checkout tags/${NYM_VERSION} \
    && cd ./mixnode \
    && cargo build --release

FROM bitnami/minideb:buster
RUN set -ex && install_packages libssl1.1 ca-certificates
VOLUME ["/root/.nym/mixnodes/mixer/data"]
ENTRYPOINT ["/tini", "-v", "--"]
CMD ["nym-mixnode", "run", "--id=mixer"]
COPY --from=builder /app/nym/target/release/nym-mixnode /usr/local/bin/
COPY --from=builder /usr/bin/tini-static /tini
COPY nym-init.sh /usr/local/bin/nym-init

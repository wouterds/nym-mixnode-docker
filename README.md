# nym-mixnode-docker

This is a multistage Docker image of the nym mixnode. The official nym repository can be found here:
https://github.com/nymtech/nym

## Setup

### Building

```sh
# build the nym-mixnode docker image
docker-compose build
```

### Certificates


```sh
# generate certificates in case you don't have them yet
docker run --rm -v ${PWD}/data:/root/.nym/mixnodes/mixer/data nym-mixnode nym-init
```

**Note:** if you already have the certificates, just place them into `./data`

### Configuration

```sh
# copy the example config file and edit where needed
cp config.toml.example config.toml
nano config.toml
```

## Running

```sh
# start your node
docker-compose up -d
```

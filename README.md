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

## Troubleshooting

If for any reason your node is having issues and/or shut down incorrectly, it sometimes help to unregister it and spin it back up. To do this you need to shut it down first (`docker-compose down`) and then run the following command.

```sh
docker run --rm -v ${PWD}/data:/root/.nym/mixnodes/mixer/data -v ${PWD}/config.toml:/root/.nym/mixnodes/mixer/config/config.toml nym-mixnode nym-mixnode unregister --id mixer
```

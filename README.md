# Dumpcerts

This container will monitor Traefik acme.json file for changes and run dumpcerts.sh if it happens. The container is using dumpcerts.sh from https://github.com/containous/traefik/blob/master/contrib/scripts/dumpcerts.sh

## Usage
* Clone this repository
* Build container.
```sh
docker build -t dumpcerts .
```

* Container is looking for "/etc/traefik/acme.json" file. Mount or bind a readonly volume where it exist. Output should be a directory, in this example readwrite volume "tls".
```sh
docker volume create tls
docker run -it -d \
  #-v path_to/acme.json:/etc/traefik/acme.json:ro \
  -v traefik:/etc/traefik:ro \
  -v tls:/tls:rw \
  dumpcerts
```
* Now all TLS certificates is dumped into volume "tls". Mount it as readonly in other containers for usage.

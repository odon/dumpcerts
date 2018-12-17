# Dumpcerts

This container will monitor Traefik acme.json file for changes and run dumpcerts.sh if it happens. The container is using dumpcerts.sh from https://github.com/containous/traefik/blob/master/contrib/scripts/dumpcerts.sh

## Usage
* Clone this repository
* Build container.
```sh
docker build -t dumpcerts .
```

* Container is looking for the file "/etc/traefik/acme.json". Mount or bind it as readonly where it exist. Output should be a directory, in this example I use readwrite volume "tls".
```sh
docker volume create tls
docker run --name dumpcerts -it -d \
  -v traefik:/etc/traefik:ro \
  -v tls:/tls:rw \
  dumpcerts
```
* Now all TLS certificates is dumped into volume "tls". Mount it as readonly in other containers for usage.

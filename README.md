README.md

## Precautions

> The configuration script contains sensitive data. Never publish this repository in the current state.

## Usage

```
docker build .
docker run -d -p 80:10001 [IMAGE]
```

or for local development

```
fig up
```

## To Do

* Daemonize with Supervisor like https://github.com/Leibnitius/etherpad-docker/ and https://github.com/arcus-io/docker-etherpad/
* Make SSL ready https://github.com/ether/etherpad-lite/wiki/Providing-encrypted-web-access-to-Etherpad-Lite-using-SSL-certificates-(HTTPS:--)

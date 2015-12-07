README.md

## Precautions

> The configuration script contains sensitive data. Never publish this repository in the current state.

## Usage

```
docker build .
docker run -d -p 10001:80 [IMAGE]
```

or for local development

```
fig up
```

## To Do

* Daemonize with Supervisor like https://github.com/Leibnitius/etherpad-docker/ and https://github.com/arcus-io/docker-etherpad/

README.md

## Precautions

> The configuration script contains sensitive data. Never publish this repository in the current state.

## Usage

```
docker build -t ecobytes:etherpad .
docker run --name="ecobytes-etherpad-data" maxexcloo/data
docker run -d -p 9001:9001 --volumes-from="ecobytes-etherpad-data" ecobytes:etherpad
```

or for local development

```
fig up
```

## To Do

* Daemonize with Supervisor like https://github.com/Leibnitius/etherpad-docker/ and https://github.com/arcus-io/docker-etherpad/
# Docker image for phpmetrics

## Supported tags and respective `Dockerfile` links

* [`2.8.1`, `latest`](https://github.com/pierreboissinot/docker-phpmetrics/blob/2.8.1/Dockerfile)

## Quick start

```sh
docker run --rm \
    --user $(id -u):$(id -g) \
    --volume $PWD:/project \
    pboissinot/phpmetrics[:tag] [<options>]
```

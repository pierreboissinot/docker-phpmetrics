Docker image for [phpmetrics](https://github.com/phpmetrics/PhpMetrics)

## Quick start

```sh
docker run --rm \
    --user $(id -u):$(id -g) \
    --volume $PWD:/project \
    pboissinot/phpmetrics:master [<options>]
```

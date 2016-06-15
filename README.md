# docker-statsd
statsd packaged for docker


## Run statsd Container

    docker run -d -p 8125:8125 --name statsd rucka/docker-statsd:v0.8.0

Test statsd:

    echo "foo:1|c" | nc -u -w0 127.0.0.1 8125

For debugging purposes you might want to drop the `-d` switch to show output.


## Build Image Yourself

### Customizing

ENVironment variables:

- GRAPHITE_HOST : the host of graphite (default: "localhost")
- GRAPHITE_PORT : the port of graphite (default: 2003)
- DEBUG : execute statsd with debug enabled (default: "false")
- LOG_LEVEL: the log level used by statsd (default:  "LOG_INFO")

### Build & Verify
    docker build -t rucka/statsd
    docker images


## Source

https://github.com/etsy/statsd/

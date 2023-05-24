[![Pulls on DockerHub](https://img.shields.io/docker/pulls/goosews/watcher.svg?style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/goosews/watcher)
[![Stars on DockerHub](https://img.shields.io/docker/stars/goosews/watcher.svg?style=for-the-badge&label=pulls&logo=docker)](https://hub.docker.com/r/goosews/watcher)
[![Stars on GitHub](https://img.shields.io/github/stars/goose-ws/watcher.svg?style=for-the-badge&label=Stars&logo=github)](https://github.com/goose-ws/watcher)

## About

A simple Alpine docker image of about 80 MB which can be used to run [paleg/Watcher](https://github.com/paleg/Watcher).

If you run in to any trouble, please report issues on [GitHub](https://github.com/goose-ws/docker-watcher).

## Getting Started

Docker run command:

`docker run --name watcher -v /path/to/data:/data -v /dir1/to/watch:/watch/dir1 -v /dir2/to/watch:/watch/dir2 goosews/watcher:latest`

Docker compose:

```yaml
version: '3.3'
services:
    watcher:
        container_name: watcher
        volumes:
            - '/path/to/data:/data'
            - '/dir1/to/watch:/watch/dir1'
            - '/dir2/to/watch:/watch/dir2'
        image: 'goosews/watcher:latest'
```

The first time you run it, it will drop a `watcher.ini.example` file in your `/data` directory. Edit that file to your needs, then re-start the container.

It runs as root, because this allows you to chown as needed. Bear in mind that your scripts/commands can chown based on a non-existant UID/GID. So if you're UID:GID is 1003:1003, even if those do not exist in the `/etc/passwd` or `/etc/group` inside the container, you can still have your scripts do `chown 1003:1003 $filename`.

## License

Distributed under the MIT License. See `LICENSE` for more information.

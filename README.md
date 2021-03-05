## About

A simple Alpine docker image of about 80 MB which can be used to run [paleg/Watcher](https://github.com/paleg/Watcher).

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

The first time you run it, it will drop a `watcher.ini` file in your `/data` directory. Edit that file to your needs, then re-start the container.

It runs as root, because this allows you to chown as needed. Bear in mind that your scripts/commands can chown based on a non-existant UID/GID. So if you're UID:GID is 1003:1003, even if those do not exist in the `/etc/passwd` or `/etc/group` inside the container, you can still have your scripts do `chown 1003:1003 $filename`.

## License

Distributed under the MIT License. See `LICENSE` for more information.

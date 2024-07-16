# Docker + Ubuntu + SSH + Python - finally all out of the box!

**[baterflyrity/dockerusp](https://github.com/baterflyrity/dockerusp)** is an convenient all-in-one Docker image that includes all basic needed stuff:
- Ubuntu base image (which uses `apt` commands).
- SSH server to remotelly connect to with login `user` and password `user` via internal port `22`.
- Python 3 preinstalled with pip package manager.
- Custom autostart scripts. Really, one can execute anything on container launches in background without blocking terminal.

## Usage

### Docker run

```shell
docker run -it -d --privileged -p 8022:22 baterflyrity/dockerusp
```

* Change port `8022` to connect with SSH at another port (`ssh user@<ip> -p <port>`).
  ```shell
	docker run -it -d --rm --privileged -p 8022:22 baterflyrity/dockerusp
  ```
* Add flag `--rm` to automatically remove container on stop.
  ```shell
	docker run -it -d --rm --privileged -p 8022:22 baterflyrity/dockerusp
  ```
* Remove `-d` flag to automatically connect to container's terminal on start.
  ```shell
	docker run -it --privileged -p 8022:22 baterflyrity/dockerusp
  ```
* Install [sysbox](https://github.com/nestybox/sysbox/blob/master/docs/user-guide/install-package.md) and replace flag `--privileged` with `--runtime=sysbox-runc` to run container in **secure** mode.
  ```shell
	docker run -it -d --runtime=sysbox-runc -p 8022:22 baterflyrity/dockerusp
  ```

## TODO

- [ ] admin\root user
- [ ] remote docker daemon access (also expose ports and publish in run command)
- [ ] add compose run alternative

## Development

1. Build docker image:

```shell
docker build . -t baterflyrity/dockerusp
```

2. Run built image:

```shell
docker run -it --rm --privileged -p 8022:22 -p 8075:2375 baterflyrity/dockerusp
```

3. Run tests and other stuff.
4. Stop and remove container: `exit`.
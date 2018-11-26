# docker-dante

A minimal and secure [Alpine Linux][alpine] based [Docker][docker] image with
[Dante][dante] SOCKS server.

## Configuration

### Host user mapping

Host user and group can be mapped to a container by defining `HOST_UID` and
`HOST_GID` environment variables. If the variables are left undefined the
container will execute its command as `nobody:nobody`.

## Logging

Container is compatible with `docker logs` command although logging is disabled
by default if the container is started with `docker-compose` command. To find
out more about logging see the command [reference][docker-logs].

## License

This project is licensed under the MIT License.

[alpine]: https://alpinelinux.org/
[docker]: https://www.docker.com/
[dante]: https://www.inet.no/dante/index.html
[docker-logs]: https://docs.docker.com/engine/reference/commandline/logs/

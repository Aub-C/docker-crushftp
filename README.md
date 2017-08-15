# docker-crushftp

A Docker container for [CrushFTP Server][crushftp]. This container installs dependencies, including Java and the newer Java Cryptography Extension.

**This container is automatically rebuilt every 48 hours with the latest updates
to Alpine Linux, Java 8 and CrushFTP 8.**

**Note:** This repository does not directly include any of the aforementioned
copyrighted products, rather, it downloads them from the servers of their
respective developers at buildtime. By using this container, you agree to any
licence terms they may have.

This container, itself, is distributed under the [MIT Licence][mit].

## Installation

This container is published on Docker Hub as [`defectivebit/crushftp`][hub].

Run the container like any other, publishing ports (exposed ports listed below)
as neccesary, and sharing the container's `/config` directory, which persists
CrushFTP's configuration, to an appropriate location on the host. Note that the
default username and password are both `crushadmin`.

Of course, you may also need to mount volumes for data you want to share with
CrushFTP. To do this, use the `-v` parameter with `docker run`.

## Ports

This container exposes these ports (publish using `-p` with `docker run`):

- **21**: FTP control channel
- **443**: HTTPS webserver
- **2000-2010**: FTP data channels (you can expand this range if you like)
- **2222**: SSH server, for SCP/SFTP
- **8080, 9090**: HTTP webserver

[crushftp]: https://www.crushftp.com
[mit]: https://github.com/defectivebit/docker-crushftp/blob/master/LICENCE
[hub]: https://hub.docker.com/r/defectivebit/crushftp/
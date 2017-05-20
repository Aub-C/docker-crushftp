# docker-crushftp

A Docker container for [CrushFTP Server][crushftp]. This container installs dependencies, including Java and the newer Java Cryptography Extension.

**Note:** This container does not directly include any of the aforementioned
copyrighted products, rather, it downloads them from the servers of their
respective developers. By using this container, you agree to any licence terms
they may have.

This container, itself, is distributed under the [MIT Licence][mit].

## Installation

Run the container like any other, publishing ports (exposed ports listed below)
as neccesary. Note that the default username and password are both `crushadmin`.

Of course, you may also need to mount volumes for data you want to share with
CrushFTP. To do this, use the `-v` parameter with `docker run`.

## Ports

This container exposes these ports (publish using `-p` with `docker run`):

- **21**: FTP control control
- **443**: HTTPS webserver
- **2000-2010**: FTP data channels (you can expand this range if you like)
- **2222**: SSH server, for SCP/SFTP
- **8080, 9090**: HTTP webserver

[crushftp]: https://www.crushftp.com
[unraid]: https://lime-technology.com
[mit]: https://github.com/defectivebit/docker-crushftp/blob/master/LICENCE
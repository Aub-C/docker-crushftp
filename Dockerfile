FROM anapsix/alpine-java:8_jdk_unlimited

LABEL maintainer "Brian Tkatch, brian@briantkatch.com"

ADD https://www.crushftp.com/early8/CrushFTP8_PC.zip /tmp/CrushFTP8_PC.zip
RUN mkdir /config \
 && mkdir /config/backup \
 && mkdir /config/jobs \
 && mkdir /config/logs \
 && mkdir /config/plugins \
 && mkdir /config/statsDB \
 && mkdir /config/syncsDB \
 && mkdir /config/users \
 && mkdir /config/extras \
 && mkdir /var/opt/CrushFTP8_PC \
 && ln -s /var/opt/CrushFTP8_PC/backup /config/backup \
 && ln -s /var/opt/CrushFTP8_PC/jobs /config/jobs \
 && ln -s /var/opt/CrushFTP8_PC/logs /config/logs \
 && ln -s /var/opt/CrushFTP8_PC/plugins /config/plugins \
 && ln -s /var/opt/CrushFTP8_PC/statsDB /config/statsDB \
 && ln -s /var/opt/CrushFTP8_PC/syncsDB /config/syncsDB \
 && ln -s /var/opt/CrushFTP8_PC/users /config/users \
 && ln -s /var/opt/CrushFTP8_PC/extras /config/extras \
 && unzip /tmp/CrushFTP8_PC.zip -d /var/opt/ \
 && rm /tmp/CrushFTP8_PC.zip \
 && cd /var/opt/CrushFTP8_PC && java -jar /var/opt/CrushFTP8_PC/CrushFTP.jar -a "crushadmin" "crushadmin"
ADD ./crushftp_init_nobackground.sh /var/opt/CrushFTP8_PC/crushftp_init_nobackground.sh
RUN chmod +x /var/opt/CrushFTP8_PC/crushftp_init_nobackground.sh

ENTRYPOINT /var/opt/CrushFTP8_PC/crushftp_init_nobackground.sh start

# FTP Server
EXPOSE 21
# HTTPS Server
EXPOSE 443
# FTP PASV transfers
EXPOSE 2000-2010
# SSH Server
EXPOSE 2222
# HTTP Servers
EXPOSE 8080 9090
############################################################
# Dockerfile to run urbackup-client
# Based on Ubuntu Image
############################################################

FROM ubuntu:trusty

RUN	apt-get update && \
	apt-get -y upgrade && \
	apt-get -y install wget && \
	cd /root && \
	wget -O - https://hndl.urbackup.org/Client/2.2.6/urbackup-client-2.2.6.tar.gz | tar zxf - && \
	cd urbackup* && \
	./configure --enable-headless --without-mail && \
	make -j 4 && \
	make install && \
	cd /root/ && \
	rm -rf urbackup*

# Ports to expose
EXPOSE 35621
EXPOSE 35622
EXPOSE 35623

VOLUME /data

ENTRYPOINT ["/usr/local/sbin/start_urbackup_client"]
CMD ["--no_daemon"]
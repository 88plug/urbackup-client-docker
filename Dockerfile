FROM ubuntu:trusty

RUN TF=`mktemp` && \
    apt-get update && \
    apt-get install -y wget && \
	wget "https://hndl.urbackup.org/Client/2.2.6/UrBackup%20Client%20Linux%202.2.6.sh" -O $TF && sudo sh $TF; rm $TF

# Ports to expose
EXPOSE 35621
EXPOSE 35622
EXPOSE 35623

VOLUME /data

ENTRYPOINT ["/usr/local/sbin/start_urbackup_client"]
CMD ["--no_daemon"]
FROM ubuntu:trusty

RUN TF=`mktemp` && \
    apt-get update && \
    apt-get install -y wget && \
        wget "https://hndl.urbackup.org/Client/2.2.6/UrBackup%20Client%20Linux%202.2.6.sh" -O $TF && sudo sh $TF; rm $TF

RUN echo "RESTORE=server-confirms" >> /etc/default/urbackupclient

# Ports to expose
EXPOSE 35621
EXPOSE 35622/udp
EXPOSE 35623

ENTRYPOINT ["/usr/local/sbin/urbackupclientbackend"]
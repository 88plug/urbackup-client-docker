FROM ubuntu:trusty

RUN TF=`mktemp` && \
    apt-get update && \
    apt-get install -y wget && \
        wget "https://hndl.urbackup.org/Client/2.4.10/UrBackup%20Client%20Linux%202.4.10.sh" -O $TF && sudo sh $TF; rm $TF

RUN   sed -i "s|RESTORE=disabled|RESTORE=server-confirms |g" /etc/default/urbackupclient

# Ports to expose
EXPOSE 35621
EXPOSE 35622/udp
EXPOSE 35623

ENTRYPOINT ["/usr/local/sbin/urbackupclientbackend"]

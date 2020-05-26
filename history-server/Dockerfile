FROM dvillaj/hadoop-cluster-base
MAINTAINER dvillaj@gmail.com

ENV USER=root

WORKDIR /root

RUN mkdir -p /var/hadoop/mr-history/tmp && \
    mkdir -p /var/hadoop/mr-history/done

ADD scripts/bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENV BOOTSTRAP /etc/bootstrap.sh

CMD ["/etc/bootstrap.sh", "-d"]
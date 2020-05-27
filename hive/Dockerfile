FROM dvillaj/hadoop-cluster-base
MAINTAINER dvillaj@gmail.com

ARG HIVE_VERSION=2.3.7

# install hadoop
RUN wget --quiet http://apache.rediris.es/hive/hive-${HIVE_VERSION}/apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    tar -xzf apache-hive-${HIVE_VERSION}-bin.tar.gz && \
    mv apache-hive-${HIVE_VERSION}-bin /usr/local && \
    ln -s /usr/local/apache-hive-${HIVE_VERSION}-bin /usr/local/hive && \
    rm apache-hive-${HIVE_VERSION}-bin.tar.gz

RUN wget -q https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.19.tar.gz && \
    tar -xzf mysql-connector-java-8.0.19.tar.gz && \
    cp mysql-connector-java-8.0.19/mysql-connector-java-8.0.19.jar /usr/local/hive/lib/ && \
    rm -rf mysql-connector-java-8.0.19*

ENV HIVE_HOME=/usr/local/hive
ENV PATH=$PATH:/usr/local/hive/bin

ADD config/hive-site.xml /usr/local/hive/conf/hive-site.xml
RUN chown root:root /usr/local/hive/conf/hive-site.xml

ADD scripts/bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENV BOOTSTRAP /etc/bootstrap.sh


CMD ["/etc/bootstrap.sh", "-d"]

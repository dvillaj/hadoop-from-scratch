# Dockerfile
FROM python:3.7-alpine

MAINTAINER dvillaj@gmail.com

ARG SPARK_VERSION=2.4.5
ARG HADOOP_VERSION=2.7

RUN wget -q https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
 && tar xzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz -C / \
 && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
 && ln -s /spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} /spark

RUN apk update && \
    apk add bash coreutils procps && \
    apk fetch openjdk8 && \
    apk add openjdk8 && \
    pip3 install ipython

ENV PYSPARK_DRIVER_PYTHON ipython

ADD scripts/bootstrap.sh /etc/bootstrap.sh
RUN chown root:root /etc/bootstrap.sh
RUN chmod 700 /etc/bootstrap.sh

ENV BOOTSTRAP /etc/bootstrap.sh

EXPOSE 8080 4040 7077

CMD ["/etc/bootstrap.sh", "-d"]
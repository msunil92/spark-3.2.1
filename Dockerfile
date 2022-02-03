FROM ubuntu

LABEL maintainer="Sunil M <msunil92@gmail.com"

RUN apt-get update && apt-get install -y vim pip zip

ARG openjdk_version="8"

RUN mkdir -p /scripts/
WORKDIR /scripts/

ADD test.py /scripts/
ADD requirements.txt /scripts/
ADD start.sh /scripts/

RUN apt-get update --yes && \
    apt-get install -y  curl git tar unzip vim wget && \
    apt-get install --yes --no-install-recommends \
    "openjdk-${openjdk_version}-jre-headless" \
    ca-certificates-java && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
ENV PATH $JAVA_HOME/bin:$PATH

RUN pip install pyspark

RUN chmod +x start.sh
RUN ./start.sh

RUN mkdir -p /code/
WORKDIR /code/

CMD [ "bash" ]

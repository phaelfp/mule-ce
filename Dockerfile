FROM openjdk:8-jdk-alpine

MAINTAINER raphael.freitaspereira@gmail.com

RUN   apk update \
 &&   apk add ca-certificates wget \
 &&   update-ca-certificates

RUN wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.21-r2/glibc-2.21-r2.apk" && \
    apk add --allow-untrusted glibc-2.21-r2.apk

WORKDIR /opt
RUN wget -O /opt/mule-standalone-3.9.0.tar.gz https://repository-master.mulesoft.org/nexus/service/local/repositories/releases/content/org/mule/distributions/mule-standalone/3.9.0/mule-standalone-3.9.0.tar.gz && \
    cd /opt
RUN echo "39b773bf20702f614faf30b2ffca4716  mule-standalone-3.9.0.tar.gz" | md5sum -c
RUN tar xvzf /opt/mule-standalone-3.9.0.tar.gz
RUN rm /opt/mule-standalone-3.9.0.tar.gz
RUN ln -s /opt/mule-standalone-3.9.0 /opt/mule 

CMD [ "/opt/mule/bin/mule" ]]

FROM openjdk:8u322-jdk
##Log4Shell CVE not detected

MAINTAINER raphael.freitaspereira@gmail.com

WORKDIR /opt

RUN wget -O /opt/mule-standalone.tar.gz https://repository.mulesoft.org/nexus/service/local/repositories/releases/content/org/mule/distributions/mule-standalone/4.4.0/mule-standalone-4.4.0.tar.gz \
 && cd /opt \
 && echo "84f9f9bd23c71b248f295d894e41fb01  mule-standalone.tar.gz" | md5sum -c \
 && tar xvzf /opt/mule-standalone.tar.gz \
 && rm /opt/mule-standalone.tar.gz \
 && mv /opt/mule-standalone-4.4.0 /opt/mule

CMD [ "/opt/mule/bin/mule" ]
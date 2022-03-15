FROM openjdk:18-jdk-alpine3.15 
##Log4Shell CVE not detected

MAINTAINER raphael.freitaspereira@gmail.com

WORKDIR /opt

RUN apk update \
 && apk add ca-certificates wget \
 && update-ca-certificates \
 && wget "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.35-r0/glibc-2.35-r0.apk" \
 && apk add --allow-untrusted glibc-2.35-r0.apk \
 && rm -rf /var/cache/apk/* \
 && rm -rf glibc-2.35-r0.apl \
 && wget -O /opt/mule-standalone.tar.gz https://repository.mulesoft.org/nexus/service/local/repositories/releases/content/org/mule/distributions/mule-standalone/4.4.0/mule-standalone-4.4.0.tar.gz \
 && cd /opt \
 && echo "84f9f9bd23c71b248f295d894e41fb01  mule-standalone.tar.gz" | md5sum -c \
 && tar xvzf /opt/mule-standalone.tar.gz \
 && rm /opt/mule-standalone.tar.gz \
 && ln -s /opt/mule-standalone-4.4.0 /opt/mule

CMD [ "/opt/mule/bin/mule" ]
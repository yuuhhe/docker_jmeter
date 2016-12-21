FROM java:7
MAINTAINER yuuhhe

ADD http://www-us.apache.org/dist/jmeter/binaries/apache-jmeter-3.1.zip /apache-jmeter-3.1.zip

RUN unzip /apache-jmeter-3.1.zip && rm /apache-jmeter-3.1.zip && mv /apache-jmeter-3.1 /jmeter && ln -s /jmeter/bin/jmeter /usr/local/bin/jmeter

COPY lib/ /jmeter/lib/

WORKDIR /jmeter

ENV RMI_PORT 1099

EXPOSE $RMI_PORT

ENTRYPOINT ["jmeter-server", "-Dserver_port=$RMI_PORT"]
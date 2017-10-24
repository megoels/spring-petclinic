FROM tomcat:8-jre8

RUN apt-get update && apt-get install -y software-properties-common

RUN rm -rf $CATALINA_HOME/webapps/*

#ADD ./run.sh /usr/local/bin/run.sh
#RUN chmod 755 /usr/local/bin/run.sh
#ADD ./petclinic.war $CATALINA_HOME/webapps/
#CMD ["/usr/local/bin/run.sh"]

WORKDIR /cd_pipeline
COPY petclinic.jar /usr/local/bin/petclinic.jar
RUN chmod 755 /usr/local/bin/petclinic.jar

ENTRYPOINT ["sh","-c","java -jar /usr/local/bin/petclinic.jar"]
#CMD ["java -jar /usr/local/bin/petclinic.jar"]

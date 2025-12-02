FROM ubuntu:20.04
MAINTAINER 'Andre'

RUN apt update && apt install -y net-tools

# ************** install Tomcat
RUN apt-get install -y openjdk-11-jdk wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34.tar.gz
RUN tar -xzf apache-tomcat-9.0.34.tar.gz -C /opt/
RUN ln -s /opt/apache-tomcat-9.0.34 /opt/tomcat

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
# ************** END of install Tomcat

WORKDIR /boxfuse-sample-java-war-hello/target/
RUN cp ./hello-1.0.war /tmp
#RUN cp ./hello-1.0.war /opt/apache-tomcat-9.0.34/webapps/

# CMD ["/bin/bash"]

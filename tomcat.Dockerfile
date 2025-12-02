FROM ubuntu:20.04
MAINTAINER 'Andre'

RUN apt update && apt install -y net-tools

# ************** install Tomcat
RUN apt-get install -y openjdk-11-jdk wget && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.34/bin/apache-tomcat-9.0.34.tar.gz
RUN tar -xzf apache-tomcat-9.0.34.tar.gz -C /opt/
RUN ln -s /opt/apache-tomcat-9.0.34 /opt/tomcat &&  \
    ln -s /opt/tomcat/webapps /webapps
WORKDIR /shared
EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
# ************** END of install Tomcat

FROM uqlibrary/docker-base:3

RUN \
  yum install -y java-1.7.0-openjdk && \
  yum clean all

COPY install.properties /opt/install.properties

RUN \
  cd /opt && \
  wget http://downloads.sourceforge.net/fedora-commons/fcrepo-installer-3.8.0.jar && \
  wget http://cdn.mysql.com/Downloads/Connector-J/mysql-connector-java-5.1.37.tar.gz && \
  tar xvzf mysql-connector-java-5.1.37.tar.gz && \
  echo 127.0.0.1 fedora > /etc/hosts && \
  echo 127.0.0.1 fedoradb > /etc/hosts && \
  java -jar fcrepo-installer-3.8.0.jar install.properties && \
  rm -f mysql-connector-java-5.1.37.tar.gz && \
  rm -f fcrepo-installer-3.8.0.jar

COPY fedora_run.sh /opt/fedora_run.sh
RUN chmod +x /opt/fedora_run.sh

EXPOSE 10081

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

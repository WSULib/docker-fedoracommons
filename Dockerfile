FROM uqlibrary/docker-base

RUN \
  yum install -y java-1.7.0-openjdk && \
  yum clean all

RUN \
  cd /opt && \
  wget http://downloads.sourceforge.net/fedora-commons/fcrepo-installer-3.8.0.jar

COPY install.properties /opt/install.properties

RUN \
  cd /opt && \
  java -jar fcrepo-installer-3.8.0.jar install.properties

COPY fedora_run.sh /opt/fedora_run.sh
RUN chmod +x /opt/fedora_run.sh

EXPOSE 10081

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD /usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf

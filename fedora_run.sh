#!/bin/bash

FEDORA_HOME=/opt/fedora
CATALINA_HOME=${FEDORA_HOME}/tomcat
PATH=$PATH:${FEDORA_HOME}/server/bin:${FEDORA_HOME}/client/bin

exec ${FEDORA_HOME}/tomcat/bin/catalina.sh run

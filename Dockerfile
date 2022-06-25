FROM jenkins/jenkins:lts

USER root
ENV JENKINS_HOME /var/lib/jenkins
ENV COPY_REFERENCE_FILE_LOG=/var/lib/jenkins/copy_reference_file.log

RUN groupmod -g 1001 jenkins
RUN usermod -u 1001 jenkins

RUN mkdir "${JENKINS_HOME}"
RUN usermod -d "${JENKINS_HOME}" jenkins
RUN chown jenkins:jenkins "${JENKINS_HOME}"
VOLUME /var/lib/jenkins

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
  apt install ansible -y

RUN apt-get update && \
  apt-get install -y gcc python-dev libkrb5-dev && \
  apt-get install python3-pip -y && \
  apt install krb5-user -y
  
USER jenkins

RUN pip3 install --upgrade pip && \
  pip3 install --upgrade virtualenv && \
  pip3 install pywinrm[kerberos] && \  
  pip3 install pywinrm

FROM centos:centos7 as base
RUN yum install -y --nogpgcheck nc

FROM base as destination
RUN echo "I am destination" > /tmp/id.txt

FROM base as source
RUN echo "I am source" > /tmp/id.txt

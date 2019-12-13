FROM centos:centos7 as base
RUN yum install -y --nogpgcheck nc git wget make gcc-c++
RUN wget https://github.com/Kitware/CMake/releases/download/v3.15.3/cmake-3.15.3.tar.gz
RUN tar xzf cmake-3.15.3.tar.gz
RUN cd cmake-3.15.3/ && ls && ./bootstrap && make && make install || cat /cmake-3.15.3/Bootstrap.cmk/cmake_bootstrap.log
RUN git clone https://github.com/DCMTK/dcmtk.git 
RUN cd dcmtk
# ./configure && \
# make all && \
# make install && \
# make distclean && \
# cd .. && \
# rm -r dcmtk

FROM base as destination
RUN echo "I am destination" > /tmp/id.txt

FROM base as source
RUN echo "I am source" > /tmp/id.txt

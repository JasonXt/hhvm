FROM ubuntu:14.04
MAINTAINER "Xu tao" <649223152@qq.com>

COPY sources.list /etc/apt/sources.list
RUN sudo echo "140.211.166.134 dl.hhvm.com" | sudo tee -a /etc/hosts
RUN sudo apt-get update
RUN sudo apt-get install -y software-properties-common python-software-properties
RUN sudo apt-get install -y wget vim

RUN sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0x5a16e7281be7a449
RUN sudo add-apt-repository "deb http://dl.hhvm.com/ubuntu $(lsb_release -sc) main"

RUN sudo apt-get update
RUN sudo apt-get install hhvm -y
RUN sudo update-rc.d hhvm defaults
RUN sudo /usr/bin/update-alternatives --install /usr/bin/php php /usr/bin/hhvm 60
EXPOSE 9000
#CMD ["hhvm","<?php"]




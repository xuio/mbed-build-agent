FROM ubuntu

WORKDIR /opt/mbed

# install deps and mbed-cli
RUN apt-get update \
&&  apt-get install -y software-properties-common \
&&  add-apt-repository -y ppa:team-gcc-arm-embedded/ppa \
&&  apt-get update \
&&  apt-get install -y gcc-arm-embedded python2.7 python python-pip git \
&&  pip install mbed-cli

# set gcc-arm as default compiler & cache mbed-os
RUN mbed config --global toolchain GCC_ARM \
&& mbed cache on \
&& mbed new dummy \
&& rm -rf dummy

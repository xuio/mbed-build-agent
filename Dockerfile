FROM ubuntu

WORKDIR /opt/mbed

# install deps and mbed-cli
RUN apt-get update
RUN apt-get install -y gcc-arm-none-eabi python2.7 python python-pip git
RUN pip install mbed-cli

# set gcc-arm as default compiler
RUN mbed config --global toolchain GCC_ARM

# enable cache and add mbed-os to it
RUN mbed cache on
RUN mbed new dummy
RUN rm -rf dummy

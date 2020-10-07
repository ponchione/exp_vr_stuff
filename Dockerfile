FROM debian:stable-slim
RUN apt-get update -y && \    
    apt-get dist-upgrade -y && \
    apt-get install build-essential -y && \
    apt-get install cmake -y && \
    apt-get install ninja-build -y && \
    apt-get install zlib1g-dev -y && \
    apt-get install libx11-dev -y && \
    apt-get install libusb-1.0-0-dev -y && \
    apt-get install freeglut3-dev -y && \
    apt-get install liblapacke-dev -y && \
    apt-get install libopenblas-dev -y && \
    apt-get install libatlas-base-dev -y

#C and C++ compiler vars for cmake
ENV CC=/usr/bin/gcc
ENV CXX=/usr/bin/g++

COPY . . 

RUN cd libsurvive && \ 
    cmake -B build -G Ninja -DCMAKE_INSTALL_PREFIX=/usr && \
    ninja -C build install
FROM fedora:latest

WORKDIR /app

RUN dnf -y upgrade && \
    dnf -y install \
    clang \
    cmake \
    git \
    ninja-build \
    make \
    gcc-c++ \
    cups-devel && \
    dnf clean all

COPY . /app

CMD ["/bin/bash"]
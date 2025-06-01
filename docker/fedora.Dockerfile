FROM fedora:latest

WORKDIR /app

# Install essential C++ development tools, documentation, and workflow tools
RUN dnf -y upgrade && \
    dnf -y install \
    clang \
    clang-tools-extra \
    doxygen \
    cmake \
    git \
    ninja-build \
    make \
    gcc-c++ \
    cups-devel && \
    dnf clean all

COPY . /app

# Optionally, set an entrypoint for workflow automation
# Example: Run a specific CMake workflow preset
ENTRYPOINT ["cmake", "--workflow", "--preset=gcc-full"]

# Or, keep an interactive shell for development
# CMD ["/bin/bash"]

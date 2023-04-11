# Use a lightweight base image
FROM manjarolinux/base

# Set the working directory to /app
WORKDIR /app

# Install necessary dependencies
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    base-devel \
    clang \
    cmake \
    git \
    ninja

# Copy the source code into the container
COPY . /app

# Set the compiler flags
ENV CXXFLAGS="-std=c++23 -Wall -Wextra -pedantic -Werror"

# Build the project using CMakePresets.json
RUN cmake --preset=Release
RUN cmake --build build/release --config Release

# Set the entrypoint to an interactive shell
CMD ["/bin/bash"]

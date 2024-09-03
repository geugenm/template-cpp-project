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

# Build the project using CMakePresets.json
RUN cmake --preset=release
RUN cmake --build build/release --config release

# Set the entrypoint to an interactive shell
CMD ["/bin/bash"]

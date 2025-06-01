# Use a lightweight base image
FROM manjarolinux/base:latest

# Set the working directory
WORKDIR /app

# Install essential C++ development tools, documentation, and workflow tools
RUN pacman -Syu --noconfirm && \
    pacman -S --noconfirm \
    base-devel \
    clang \
    clang-doc \
    doxygen \
    cmake \
    git \
    ninja

# Copy the source code into the container
COPY . /app

# Optionally, set an entrypoint for workflow automation
# Example: Run a specific CMake workflow preset
ENTRYPOINT ["cmake", "--workflow", "--preset=gcc-full"]

# Or, keep an interactive shell for development
# CMD ["/bin/bash"]

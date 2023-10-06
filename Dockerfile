# Use an official NVIDIA CUDA base image
FROM nvidia/cuda:12.2.0-devel-ubuntu20.04


# Set the environment variables to non-interactive (this prevents some prompts)
ENV DEBIAN_FRONTEND=non-interactive

# Install some basic utilities and Python3
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    python3 \
    python3-pip \
 && rm -rf /var/lib/apt/lists/*

# Clone the repository
RUN git clone https://github.com/macunaimaa/RL_VSSS_PQMEC.git

RUN apt-get update && apt-get install -y python3-pip

# Navigate to the repository directory
WORKDIR /RL_VSSS_PQMEC

# Install Python dependencies from requirements.txt
RUN pip install -r Requirements.txt
RUN pip install PyOpenGL
RUN apt-get install -y xvfb
RUN pip install tensorflow[and-cuda]
RUN apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/7fa2af80.pub
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys <KEY_ID>

CMD ["/bin/bash"]

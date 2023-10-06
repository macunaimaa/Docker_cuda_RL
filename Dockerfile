# Use an official NVIDIA CUDA base image
FROM nvidia/cuda:12.0.0-cudnn8-devel-ubuntu20.04

RUN apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3B4FE6ACC0B21F32
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 78BD65473CB3BD13


# Install some basic utilities and Python3
RUN apt-get update && apt-get install -y \
    curl \
    ca-certificates \
    sudo \
    git \
    bzip2 \
    libx11-6 \
    python3 \
    python3-pip && \
    rm -rf /var/lib/apt/lists/*


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
CMD ["/bin/bash"]

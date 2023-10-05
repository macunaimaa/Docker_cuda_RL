# Use an official NVIDIA CUDA base image
FROM nvidia/cuda:12.2.0-devel-ubuntu22.04


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

# Navigate to the repository directory
WORKDIR /RL_VSSS_PQMEC

# Install Python dependencies from requirements.txt
RUN pip3 install -r Requirements.txt

CMD ["/bin/bash"]

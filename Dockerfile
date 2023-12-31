# Use an official NVIDIA CUDA base image
FROM tensorflow/tensorflow:nightly-gpu


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
# RUN pip install PyOpenGL
# RUN apt-get install -y xvfb
# RUN pip install tensorflow[and-cuda]
CMD ["/bin/bash"]

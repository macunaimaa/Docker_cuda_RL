xhost +local:docker
sudo docker run --gpus all -it --rm \
    cuda_vsss:1.0
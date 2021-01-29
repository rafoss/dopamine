FROM tensorflow/tensorflow:2.3.0-gpu

## Install packages and set up user and passwordless sudo
RUN apt-get update
RUN apt-get --assume-yes install sudo bash-completion git vim python3-venv
RUN useradd -m tf
RUN echo "ALL ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
WORKDIR "/home/tf"
USER tf

## Setup for python development
ENV PATH="$PATH:/home/tf/.local/bin"
RUN pip install -U pip

# Setup for the current project
WORKDIR dopamine
RUN sudo apt-get --assume-yes install libsm6 libxrender-dev ffmpeg ttf-bitstream-vera

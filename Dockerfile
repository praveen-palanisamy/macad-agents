FROM nvidia/cuda:10.0-cudnn7-devel-ubuntu18.04

#ENV NO_PROXY="localhost, 127.0.0.1"
#ENV http_proxy=http://USER:PASSWORD@DOMAIN.com
#ENV https_proxy=https://USER:PASSWORd@DOMAIN.com:80
#ENV ftp_proxy=http://USER:PASSWORD@DOMAIN.com:80

RUN echo -e "\n**********************\nNVIDIA Driver Version\n**********************\n" && \
	cat /proc/driver/nvidia/version && \
	echo -e "\n**********************\nCUDA Version\n**********************\n" && \
	nvcc -V

ENV DEBIAN_FRONTEND=noninteractive

# Install some dependencies
RUN apt-get update && apt-get install -y \
		bc \
		build-essential \
		cmake \
		curl \
		g++ \
		gfortran \
		git \
		libffi-dev \
		libfreetype6-dev \
		libhdf5-dev \
		libjpeg-dev \
		liblcms2-dev \
		libopenblas-dev \
		liblapack-dev \
		libopenjp2-7 \
		libpng-dev \
		libssl-dev \
		libtiff5-dev \
		libwebp-dev \
		libzmq3-dev \
		nano \
		pkg-config \
		python-dev \
		software-properties-common \
		unzip \
		vim \
		wget \
		zlib1g-dev \
		qt5-default \
		libvtk6-dev \
		zlib1g-dev \
		libjpeg-dev \
		libwebp-dev \
		libpng-dev \
		libtiff5-dev \
		# libjasper-dev \ If reqd by OpenCV, sudo add-apt-repository “deb http://security.ubuntu.com/ubuntu xenial-security main” && sudo apt update && sudo apt install libjasper1 libjasper-dev
		libopenexr-dev \
		libgdal-dev \
		libdc1394-22-dev \
		libavcodec-dev \
		libavformat-dev \
		libswscale-dev \
		libtheora-dev \
		libvorbis-dev \
		libxvidcore-dev \
		libx264-dev \
		yasm \
		libopencore-amrnb-dev \
		libopencore-amrwb-dev \
		libv4l-dev \
		libxine2-dev \
		libtbb-dev \
		libeigen3-dev \
		python-dev \
		python-tk \
		python-numpy \
		python3-dev \
		python3-tk \
		python3-numpy \
		ant \
		default-jdk \
		doxygen \
	&& apt-get clean \
	&& apt-get autoremove \
	&& rm -rf /var/lib/apt/lists/*

# Setup conda and base pkgs
RUN	echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh \
    && wget \
        --quiet 'https://repo.continuum.io/archive/Anaconda3-5.2.0-Linux-x86_64.sh' \
        -O /tmp/anaconda.sh \
    && /bin/bash /tmp/anaconda.sh -b -p /opt/conda \
    && rm /tmp/anaconda.sh \
    && /opt/conda/bin/conda install -y \
        libgcc \
    && /opt/conda/bin/conda clean -y --all \
    && /opt/conda/bin/pip install \
        flatbuffers \
        cython==0.29.0 \
        numpy==1.15.4


ENV PATH "/opt/conda/bin:$PATH"

RUN conda install -y numpy
RUN apt-get install -y zlib1g-dev
# The following is needed to support TensorFlow 1.14
RUN conda remove -y --force wrapt
RUN pip install -U pip
RUN pip install gym[atari] opencv-python-headless tensorflow-gpu==1.14 lz4 keras pytest-timeout smart_open tensorflow_probability
RUN pip install -U h5py  # Mutes FutureWarnings
RUN pip install --upgrade bayesian-optimization
RUN pip install --upgrade hyperopt==0.1.2
RUN pip install ConfigSpace==0.4.10
RUN pip install --upgrade sigopt nevergrad scikit-optimize hpbandster lightgbm xgboost torch torchvision
RUN pip install -U tabulate mlflow
RUN pip install -U pytest-remotedata>=0.3.1
RUN pip install ray==0.6.2 psutil ray[debug]==0.6.2
RUN pip install macad-gym

# Set CARLA_SERVER path; Remember to mount the CARLA binary dir on host to this dir
ENV CARLA_SERVER=/software/CARLA/CarlaUE4.sh

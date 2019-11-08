FROM tensorflow/tensorflow:latest-devel-gpu-py3

RUN apt-get install -y build-essential checkinstall software-properties-common llvm cmake wget git nano nasm yasm zip unzip pkg-config && apt-get update

RUN apt-get install -y python3-pip

RUN pip3 install --upgrade \
    pip \
    setuptools

RUN pip3 install pandas==0.23.0 numpy==1.14.3 scikit-learn==0.19.1 tqdm==4.26.0 seaborn==0.8.1 matplotlib==2.2.2 scipy==1.3.1 catboost==0.13.1 torch==1.3.0 torchvision==0.4.1 

RUN pip3 install --pre xgboost==0.82
RUN pip3 install psycopg2-binary
RUN pip3 install comet_ml

RUN pip3 install ipython[all]
ENV NVIDIA_VISIBLE_DEVICES all
ENV NVIDIA_DRIVER_CAPABILITIES compute,utility

ENTRYPOINT ["jupyter", "notebook", "--no-browser", "--allow-root", "--ip=0.0.0.0"]

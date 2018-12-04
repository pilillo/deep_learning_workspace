FROM tensorflow/tensorflow:latest-gpu

RUN apt-get -y install wget && \
    pip install -U jupyterlab keras livelossplot tables scikit-image tqdm && \
    pip install -U dask[complete]

CMD jupyter lab --allow-root

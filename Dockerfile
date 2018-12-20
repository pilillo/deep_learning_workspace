FROM tensorflow/tensorflow:latest-gpu

RUN apt-get -y install wget && \
    pip install -U jupyterlab keras livelossplot tables scikit-image tqdm && \
    pip install -U dask[complete] && \
    pip install -U mlflow

# reminder that we expose port 5000 for MlFlow
# Jupyter is exposing 8888
EXPOSE 5000
EXPOSE 8888

CMD mlflow ui --file-store /notebooks/workspace/mlflow_server --host 0.0.0.0 --port 5000 & \
    jupyter lab --allow-root

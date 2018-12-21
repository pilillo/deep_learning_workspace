FROM tensorflow/tensorflow:latest-gpu

MAINTAINER Andrea Monacchi

ENV WORKSPACE=/notebooks/workspace
ENV SPARK_HOME=/notebooks/spark
ENV SPARK_VERSION=2.4.0
ENV HADOOP_VERSION=2.7

RUN apt-get -y install wget \
    # installing data science packages
    && pip install -U jupyterlab keras livelossplot tables scikit-image tqdm bokeh \
    && pip install -U dask[complete] \
    # mlflow for keeping experiments
    && pip install -U mlflow \
    # installing java
    && apt-get update && apt-get install --yes --force-yes openjdk-8-jre \
    # installing spark
    && pip install -U findspark \
    && wget http://apache.mirror.iphh.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
    && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# reminder that we expose port 5000 for MlFlow
# Jupyter is exposing 8888
EXPOSE 5000
EXPOSE 8888

CMD mlflow ui --file-store ${WORKSPACE}/mlflow_server --host 0.0.0.0 --port 5000 & \
    jupyter lab --allow-root

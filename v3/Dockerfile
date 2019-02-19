FROM tensorflow/tensorflow:latest-gpu-py3

MAINTAINER Andrea Monacchi

ENV WORKSPACE=/notebooks/workspace
#ENV SPARK_HOME=/notebooks/spark
#ENV SPARK_VERSION=2.4.0
#ENV HADOOP_VERSION=2.7

RUN apt-get update \
    && apt-get -y install wget \
    # installing data science packages
    && pip install -U jupyterlab \
    && pip install -U keras livelossplot tables scikit-image tqdm seldon-core bokeh dask[complete] xgboost \
    # mlflow for keeping experiments
    && pip install -U mlflow
    # installing java
    #&& apt-get update && apt-get install --yes --force-yes openjdk-8-jre \
    # installing spark
    #&& pip install -U findspark \
    #&& wget http://apache.mirror.iphh.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    #&& tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    #&& mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
    #&& rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

RUN wget https://github.com/openshift/source-to-image/releases/download/v1.1.13/source-to-image-v1.1.13-b54d75d3-linux-amd64.tar.gz -O s2i.tar.gz \
    && mkdir -p $PWD/s2i && tar -xvf s2i.tar.gz -C $PWD/s2i && rm s2i.tar.gz \
    && chmod +x $PWD/s2i/s2i \
    && cp $PWD/s2i/s2i /usr/local/bin \
    && rm -rf $PWD/s2i

RUN apt-get -y install git \
    && apt-get install -y libltdl7

# reminder that we expose port 5000 for MlFlow
# Jupyter is exposing 8888
EXPOSE 5000
EXPOSE 8888

CMD mlflow ui --file-store ${WORKSPACE}/mlflow_server --host 0.0.0.0 --port 5000 & \
    jupyter lab --allow-root --ip=0.0.0.0

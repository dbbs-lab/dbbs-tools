FROM ubuntu:20.04

RUN apt-get update
ENV TZ=Europe/Rome
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get install --yes build-essential libopenmpi-dev python3.9 python3.9-dev python3-pip ssh openmpi-bin
RUN python3.9 -m pip install --upgrade pip wheel
RUN python3.9 -m pip install numpy plotly matplotlib voxcell ipywidgets elephant neuron "bsb[neuron]>=4.0.0a42" jupyterlab scikit-image
RUN apt-get clean
COPY entrypoint.sh /usr/local/bin/

COPY notebooks/ /notebooks/
EXPOSE 8888
WORKDIR /workspace/
ENTRYPOINT ["bash", "entrypoint.sh"]

FROM linaro/tensorflow-arm-neoverse-n1:2.3.0-eigen
MAINTAINER TANNY CHAVEZ

COPY requirements.txt requirements.txt

RUN sudo apt-get update && sudo apt-get install -y \
    build-essential \
    python3-pip

RUN pip3 install --upgrade pip &&\
    pip3 install -r requirements.txt 

ENV PYTHONUNBUFFERED=1
WORKDIR /work
ENV HOME /work

COPY main.py main.py
COPY model.py model.py
COPY data.py data.py

CMD ["/bin/bash"]


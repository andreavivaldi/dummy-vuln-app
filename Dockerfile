FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3-pip \
        python3-numpy \
        openssh-server \
        build-essential \
        libssl-dev \
        libffi-dev \
        python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN python3 -m pip install flask
COPY app.py /app.py
EXPOSE 5000 22
ENTRYPOINT ["python3", "./app.py"]

FROM debian:stable-slim

# Prevents interactive prompts and ensures consistent apt behavior
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3-pip \
        python3-numpy \
        openssh-server \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

RUN pip install flask
COPY app.py /app.py
EXPOSE 5000 22
ENTRYPOINT ["python", "./app.py"]

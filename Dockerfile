FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        python3-pip \
        python3-flask \
        python3-dev \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY app.py /app.py
EXPOSE 5000 22
ENTRYPOINT ["python3", "./app.py"]

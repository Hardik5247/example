FROM --platform=linux/amd64 python:3.9
ARG FOO
ARG BAR
ENV FOO_ENV=$FOO
ENV BAR_ENV=$BAR
RUN echo $FOO_ENV
RUN echo $BAR_ENV
ENV PATH=/virtualenvs/venv/bin:$PATH
RUN python -m venv /virtualenvs/venv/
RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends htop && rm -rf /var/lib/apt/lists/*
RUN python -m pip install -U pip setuptools wheel && python -m pip install --use-pep517 --no-cache-dir 'numpy'
COPY . /app
WORKDIR /app
ENTRYPOINT sleep 3600

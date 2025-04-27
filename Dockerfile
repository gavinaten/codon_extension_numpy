FROM python:3.10-slim

RUN apt-get update && \
    apt-get install -y build-essential curl tar gzip && \
    pip install setuptools && \
    pip install numpy


# should handle the codon install and path setup
RUN curl -fsSL https://exaloop.io/install.sh | bash -s -- --non-interactive
ENV PATH="/root/.codon/bin:$PATH"

COPY . /home
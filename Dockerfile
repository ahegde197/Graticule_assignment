FROM python:3.9-slim-bullseye

RUN useradd -m -U -u 1000 user1

WORKDIR /home/user1

COPY setup.py .
RUN mkdir service
COPY service/__init__.py service/main.py ./service/

RUN apt update && apt upgrade -y
USER user1
RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir --upgrade -e .

USER root
RUN chown -R user1:user1 /home

USER user1


CMD uvicorn --app-dir service main:service --host 0.0.0.0 --port 8001

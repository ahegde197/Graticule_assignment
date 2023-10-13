FROM python:3.9-slim-bullseye

#creating a non root user "user1"
RUN useradd -m -U -u 1000 user1

WORKDIR /home/user1

COPY setup.py .
RUN mkdir service
COPY service/__init__.py service/main.py ./service/

RUN apt update && apt upgrade -y

#Switching to Root to install the below two system wide packages
USER root
RUN pip install --no-cache-dir --upgrade pip setuptools
RUN pip install --no-cache-dir uvicorn

USER user1
RUN pip install --no-cache-dir --upgrade -e .

#Changing the ownership to "user1"
USER root
RUN chown -R user1:user1 /home

USER user1


CMD uvicorn --app-dir service main:service --host 0.0.0.0 --port 8001
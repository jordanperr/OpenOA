FROM continuumio/anaconda3:2018.12

LABEL maintainer="jordan.perr-sauer@nrel.gov"

RUN pip install pygam==0.8

COPY . /code

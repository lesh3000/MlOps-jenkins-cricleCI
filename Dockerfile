FROM jupyter/scipy-notebook

RUN pip install joblib


USER root
RUN apt-get update && apt-get install -y jq

RUN mkdir model raw_data processed_data results


ENV RAW_DATA_DIR=/home/jovyan/raw_data
ENV PROCESSED_DATA_DIR=/home/jovyan/processed_data
ENV MODEL_DIR=/home/jovyan/model
ENV RESULTS_DIR=/home/jovyan/results
ENV RAW_DATA_FILE=adult.csv


COPY adult.csv ./raw_data/adult.csv
COPY code/preprocessing.py ./preprocessing.py
COPY code/train.py ./train.py
COPY code/test.py ./test.py
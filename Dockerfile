FROM cimg/python:3.8.7

USER root
WORKDIR /
RUN mkdir model

COPY /code /
COPY adult.csv /
COPY requirements.txt /

RUN pip install --upgrade pip && pip install --trusted-host pypi.python.org -r requirements.txt


ENV key_id=$key_id
ENV secret_key=$secret_key
ARG entry=preprocessing
ENV entry_e=$entry
ENV python=python

RUN echo "python -m $entry_e \$@" > /run_module.sh
CMD ["/bin/bash", "/run_module.sh"]
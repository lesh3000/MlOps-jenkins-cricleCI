FROM cimg/python:3.8.7

USER root
WORKDIR /
RUN mkdir model

COPY /code /
COPY adult.csv /
COPY requirements.txt /

RUN pip install --upgrade pip && pip install --trusted-host pypi.python.org -r requirements.txt



CMD ["python", "preprocessing.py"]
FROM cimg/python:3.8.7

USER root
WORKDIR /
RUN mkdir model

COPY /code /
COPY adult.csv /
COPY requirements.txt /

RUN pip install --upgrade pip && pip install --trusted-host pypi.python.org -r requirements.txt

ENV key=$key_id
RUN echo $key_id
RUN echo "JJJJJJJJJJJ"
ENV key_id=AKIAXULVIJNCB2J7YHHJ
ENV secret_key=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


CMD ["python", "preprocessing.py"]
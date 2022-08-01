from flask import Flask, request, jsonify
from flask.logging import create_logger
import logging
import boto3
from io import BytesIO
import os

import pandas as pd
from joblib import load


app = Flask(__name__)
LOG = create_logger(app)
LOG.setLevel(logging.INFO)


@app.route("/")
def home():
    html = "<h3>Sklearn Prediction Home</h3>"
    return html.format(format)


@app.route("/predict", methods=['POST'])
def predict():
    # Logging the input payload
    json_payload = request.json
    print(json_payload)
    LOG.info(f"JSON payload: \n{json_payload}")
    inference_payload = pd.DataFrame(json_payload)
    LOG.info(f"Inference payload DataFrame: \n{inference_payload}")
    # scale the input
    df = pd.read_csv("adult.csv", sep=",")[:5]
    print(df)

    df['income'].replace(['<=50K', '>50K'], [0, 1], inplace=True)
    df.drop('fnlwgt', axis=1, inplace=True)
    df.drop('education.num', axis=1, inplace=True)
    df = df.loc[(df['workclass'] != '?') & (df['occupation'] != '?') & (df['native.country'] != '?')]
    X = df.drop('income', axis=1)
    print(X)

    X_continous = X[['age', 'capital.gain', 'capital.loss', 'hours.per.week']]
    X_categorical = X[['workclass', 'education', 'marital.status', 'occupation', 'relationship', 'race',
                       'sex', 'native.country']]



    X_encoded = pd.get_dummies(X_categorical)
    data = pd.concat([ X_continous, X_encoded], axis=1)
    print(data)

    predictions= list(logit_model.predict(data))

    LOG.info(f"Prediction: \n{predictions}")

    return jsonify({'prediction': predictions})


if __name__ == "__main__":
    print(os.environ['key_id'])
    print(os.getenv('key_id'))
    session = boto3.Session(
        aws_access_key_id= os.environ['key_id'],
        aws_secret_access_key= os.environ['secret_key'],
        region_name= "eu-west-1"

    )

    s3 = session.resource('s3')
    s3.Bucket('my-train-bucket-hehe-837').download_file('model/model.sav', 'model.sav')

    logit_model = load('model/model.sav')
    app.run(host='0.0.0.0', port=80, debug=True)

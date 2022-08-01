from flask import Flask, request, jsonify
from flask.logging import create_logger
import logging
import boto3
from io import BytesIO

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
    LOG.info(f"JSON payload: \n{json_payload}")
    inference_payload = pd.DataFrame(json_payload)
    LOG.info(f"Inference payload DataFrame: \n{inference_payload}")
    # scale the input
    df = pd.read_csv("adult.csv", sep=",")[:2]

    df['income'].replace(['<=50K', '>50K'], [0, 1], inplace=True)
    df.drop('fnlwgt', axis=1, inplace=True)
    df.drop('education.num', axis=1, inplace=True)
    df = df.loc[(df['workclass'] != '?') & (df['occupation'] != '?') & (df['native.country'] != '?')]
    X = df.drop('income', axis=1)

    X_continous = X[['age', 'capital.gain', 'capital.loss', 'hours.per.week']]
    X_categorical = X[['workclass', 'education', 'marital.status', 'occupation', 'relationship', 'race',
                       'sex', 'native.country']]

    X_encoded = pd.get_dummies(X_categorical)
    data = pd.concat([y, X_continous, X_encoded], axis=1)


    predictions= list(logit_model.predict(data))

    LOG.info(f"Prediction: \n{predictions}")

    return jsonify({'prediction': predictions})


if __name__ == "__main__":
    with BytesIO() as f:
        boto3.client("s3").download_fileobj(Bucket="my-train-bucket-hehe-837", Key="model.save", Fileobj=f)
        f.seek(0)

        logit_model = load(f)
    app.run(host='0.0.0.0', port=80, debug=True)

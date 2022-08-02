from flask import Flask, request, jsonify
from flask.logging import create_logger
import logging
import boto3

import os
import json
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
    inference_payload = pd.DataFrame.from_dict(json_payload)


    predictions= logit_model.predict(inference_payload)

    LOG.info(f"Prediction: \n{predictions}")

    return json.dumps({'prediction': str(predictions[0])})


if __name__ == "__main__":

    s3= boto3.client('s3', aws_access_key_id=os.environ["key_id"],
                             aws_secret_access_key=os.environ["secret_key"])
    model_path="model.sav"
    s3.download_file('my-train-bucket-hehe-837',  model_path, 'model.sav')
    logit_model = load(model_path)
    LOG.info(f"model loaded")
    app.run(host='0.0.0.0', port=80, debug=True)

import os
import pandas as pd
from sklearn.model_selection import train_test_split
from joblib import dump

from sklearn.model_selection import StratifiedKFold, cross_val_score
from sklearn.linear_model import LogisticRegression
import boto3

print("here")
print(os.environ['key_id'])
session = boto3.Session(
    aws_access_key_id=os.environ['key_id'],
    aws_secret_access_key=os.environ['secret_key'],
    region_name="eu-west-1"

)

s3 = session.resource('s3')

df = pd.read_csv("adult.csv", sep=",")
df['income'].replace(['<=50K','>50K'],[0,1], inplace=True)
df.drop('fnlwgt', axis=1, inplace=True)
df.drop('education.num', axis=1, inplace=True)
df = df.loc[ (df['workclass'] != '?') & (df['occupation'] != '?') & (df['native.country']!= '?')]
X = df.drop('income', axis=1)
y = df['income'].to_frame()


X_continous  = X[['age', 'capital.gain', 'capital.loss', 'hours.per.week']]
X_categorical = X[['workclass', 'education', 'marital.status', 'occupation', 'relationship', 'race',
                   'sex', 'native.country']]

X_encoded = pd.get_dummies(X_categorical)
data = pd.concat([y, X_continous, X_encoded],axis=1)

train, test = train_test_split(data, test_size=0.3, stratify=data['income'])

X_train = train.drop('income', axis=1)
y_train = train['income']

logit_model = LogisticRegression(max_iter=10000)
logit_model = logit_model.fit(X_train, y_train)

cv = StratifiedKFold(n_splits=3)
val_logit = cross_val_score(logit_model, X_train, y_train, cv=cv).mean()

dump(logit_model, "/model/model.sav")

object = s3.Object('my-train-bucket-hehe-837', 'model.sav')

with open('/model/model.sav', 'rb') as data:
    result = object.put(Body=data)
print(result)





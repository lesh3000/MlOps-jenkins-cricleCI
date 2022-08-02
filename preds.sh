#!/usr/bin/env bash
PORT=8000
echo "Port: $PORT"

# POST method predict
curl -d '{"age": {"1": 82}, "capital.gain": {"1": 0}, "capital.loss": {"1": 4356}, "hours.per.week": {"1": 18}, "workclass_Federal-gov": {"1": 0}, "workclass_Local-gov": {"1": 0}, "workclass_Private": {"1": 1}, "workclass_Self-emp-inc": {"1": 0}, "workclass_Self-emp-not-inc": {"1": 0}, "workclass_State-gov": {"1": 0}, "workclass_Without-pay": {"1": 0}, "education_10th": {"1": 0}, "education_11th": {"1": 0}, "education_12th": {"1": 0}, "education_1st-4th": {"1": 0}, "education_5th-6th": {"1": 0}, "education_7th-8th": {"1": 0}, "education_9th": {"1": 0}, "education_Assoc-acdm": {"1": 0}, "education_Assoc-voc": {"1": 0}, "education_Bachelors": {"1": 0}, "education_Doctorate": {"1": 0}, "education_HS-grad": {"1": 1}, "education_Masters": {"1": 0}, "education_Preschool": {"1": 0}, "education_Prof-school": {"1": 0}, "education_Some-college": {"1": 0}, "marital.status_Divorced": {"1": 0}, "marital.status_Married-AF-spouse": {"1": 0}, "marital.status_Married-civ-spouse": {"1": 0}, "marital.status_Married-spouse-absent": {"1": 0}, "marital.status_Never-married": {"1": 0}, "marital.status_Separated": {"1": 0}, "marital.status_Widowed": {"1": 1}, "occupation_Adm-clerical": {"1": 0}, "occupation_Armed-Forces": {"1": 0}, "occupation_Craft-repair": {"1": 0}, "occupation_Exec-managerial": {"1": 1}, "occupation_Farming-fishing": {"1": 0}, "occupation_Handlers-cleaners": {"1": 0}, "occupation_Machine-op-inspct": {"1": 0}, "occupation_Other-service": {"1": 0}, "occupation_Priv-house-serv": {"1": 0}, "occupation_Prof-specialty": {"1": 0}, "occupation_Protective-serv": {"1": 0}, "occupation_Sales": {"1": 0}, "occupation_Tech-support": {"1": 0}, "occupation_Transport-moving": {"1": 0}, "relationship_Husband": {"1": 0}, "relationship_Not-in-family": {"1": 1}, "relationship_Other-relative": {"1": 0}, "relationship_Own-child": {"1": 0}, "relationship_Unmarried": {"1": 0}, "relationship_Wife": {"1": 0}, "race_Amer-Indian-Eskimo": {"1": 0}, "race_Asian-Pac-Islander": {"1": 0}, "race_Black": {"1": 0}, "race_Other": {"1": 0}, "race_White": {"1": 1}, "sex_Female": {"1": 1}, "sex_Male": {"1": 0}, "native.country_Cambodia": {"1": 0}, "native.country_Canada": {"1": 0}, "native.country_China": {"1": 0}, "native.country_Columbia": {"1": 0}, "native.country_Cuba": {"1": 0}, "native.country_Dominican-Republic": {"1": 0}, "native.country_Ecuador": {"1": 0}, "native.country_El-Salvador": {"1": 0}, "native.country_England": {"1": 0}, "native.country_France": {"1": 0}, "native.country_Germany": {"1": 0}, "native.country_Greece": {"1": 0}, "native.country_Guatemala": {"1": 0}, "native.country_Haiti": {"1": 0}, "native.country_Holand-Netherlands": {"1": 0}, "native.country_Honduras": {"1": 0}, "native.country_Hong": {"1": 0}, "native.country_Hungary": {"1": 0}, "native.country_India": {"1": 0}, "native.country_Iran": {"1": 0}, "native.country_Ireland": {"1": 0}, "native.country_Italy": {"1": 0}, "native.country_Jamaica": {"1": 0}, "native.country_Japan": {"1": 0}, "native.country_Laos": {"1": 0}, "native.country_Mexico": {"1": 0}, "native.country_Nicaragua": {"1": 0}, "native.country_Outlying-US(Guam-USVI-etc)": {"1": 0}, "native.country_Peru": {"1": 0}, "native.country_Philippines": {"1": 0}, "native.country_Poland": {"1": 0}, "native.country_Portugal": {"1": 0}, "native.country_Puerto-Rico": {"1": 0}, "native.country_Scotland": {"1": 0}, "native.country_South": {"1": 0}, "native.country_Taiwan": {"1": 0}, "native.country_Thailand": {"1": 0}, "native.country_Trinadad&Tobago": {"1": 0}, "native.country_United-States": {"1": 1}, "native.country_Vietnam": {"1": 0}, "native.country_Yugoslavia": {"1": 0}}' \
     -H "Content-Type: application/json" \
     -X POST http://localhost:$PORT/predict

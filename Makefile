setup:
	# Create python virtualenv & source it
	# source ~/.devops/bin/activate
	python3 -m venv ~/.devops

install:
	# This should be run from inside a virtualenv
	pip install --upgrade pip &&\
		pip install -r requirements.txt
buildtrain:
	sh buildtrain.sh

buildpreds:
	sh buildpreds.sh

test:
	# Additional, optional, tests could go here
	#python -m pytest -vv --cov=myrepolib tests/*.py
	#python -m pytest --nbval notebook.ipynb

lint:
	# See local hadolint install instructions:   https://github.com/hadolint/hadolint
	# This is linter for Dockerfiles
	hadolint Dockerfile
	# This is a linter for Python source code linter: https://www.pylint.org/
	# This should be run from inside a virtualenv
	pylint --disable=R,C,W1203,W1202,W1514,DL3013 ./code

createeks:
	aws cloudformation create-stack \
  --stack-name ekscreate \
  --template-body file://eks.yml \
  --region us-west-1 --capabilities CAPABILITY_NAMED_IAM

all: install lint test
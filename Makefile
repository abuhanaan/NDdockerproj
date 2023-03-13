setup:
	python3 -m venv ~/.dockerproj
		source ~/.dockerproj/bin/activate
	
install:
	pip install --upgrade pip &&\
    	pip install --trusted-host pypi.python.org -r requirements.txt
    	
test:
	# python -m pytest --vv --cov=myrepolib tests/*.py
	# python -m pytest --nbval notebok.ipynb
	
validate-circleci:
	# See https://circleci.com/docs/2.0/local-cli/#processing-a-config
	circleci config process .circleci/config.yml

run-circleci-local:
	# See https://circleci.com/docs/2.0/local-cli/#running-a-job
	.circleci local execute
	
lint:
	hadolint Dockerfile
	pylint --disable=R,C,W1203 app.py
	
all: install lint test
mkdir lab1-s3-lambda-$1 && cd lab1-s3-lambda-$1
cdk init app --language python

pip install -r requirements.txt
pip install aws-cdk-lib constructs
cd ..
git clone https://github.com/cloud-dev-user/lab1-s3-lambda.git
cd lab1-s3-lambda
cp lab1_s3_lambda/lab1_s3_lambda_stack.py  ../lab1-s3-lambda-$1/lab1_s3_lambda_$1/lab1_s3_lambda_$1_stack.py
cp -r lambda  ../lab1-s3-lambda-$1/
cd  ../lab1-s3-lambda-$1/
source .venv/bin/activate 
cdk synth
cdk deploy

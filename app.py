#!/usr/bin/env python3
import aws_cdk as cdk

from lab1_s3_lambda.lab1_s3_lambda_stack import Lab1S3LambdaStack


app = cdk.App()

Lab1S3LambdaStack(app, "Lab1S3LambdaStack")

app.synth()


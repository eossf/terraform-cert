# complete module docker 

The state is saved in S3, we need these rights for tf
s3:ListBucket on arn:aws:s3:::s3bucket
s3:GetObject on arn:aws:s3:::s3bucket/path/to/tfstate
s3:PutObject on arn:aws:s3:::s3bucket/path/to/tfstate 

## security 
terraform checks by default ~/.aws/credentials for accessing S3 

## container module
## image module


import boto3
import sys
from pathlib import Path

print(len(sys.argv))
if len(sys.argv) != 2:
	print("Specify path to file as argument 1")
	sys.exit(1)

uploadFilePath = Path(sys.argv[1])

if not uploadFilePath.exists():
	print("Specified path is not existing directory or file")
	sys.exit(1)
 
s3 = boto3.client('s3')

s3.upload_file(uploadFilePath, 'valentyn-s3', "py-uploaded/" + uploadFilePath.name)

print("File successfully uploaded")

docker buildx build -f ./pulumi.dockerfile -t dev-environments-pulumi:latest .
docker push baoduy2412/dev-environments-pulumi -a
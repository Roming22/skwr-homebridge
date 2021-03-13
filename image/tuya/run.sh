docker build -f ./Dockerfile -t tuya:latest .
clear
docker run -it --env-file ../../etc/secret.env --rm tuya:latest

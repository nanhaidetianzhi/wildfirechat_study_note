docker rm -f api-im
docker rmi -f yatoujiang/api-im:1.0
docker build -t yatoujiang/api-im:1.0 .
docker run  --net host --restart=always --name api-im  -e TZ="Asia/Shanghai" -v /etc/localtime:/etc/localtime:ro -d yatoujiang/api-im:1.0
docker logs -f api-im
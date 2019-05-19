docker rm -f broken
docker rmi -f yatoujiang/broken:1.0
docker build -t  yatoujiang/broken:1.0 .
docker run --net host --restart=always --name broken  -e TZ="Asia/Shanghai" -v /etc/localtime:/etc/localtime:ro -d  yatoujiang/broken:1.0
docker logs -f broken
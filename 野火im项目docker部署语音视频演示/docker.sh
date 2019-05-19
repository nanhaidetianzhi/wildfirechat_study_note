#/bin/bash
echo "正在更新系统"
yum update -y
echo "系统更新完成"


echo "正在安装docker"
yum install -y yum-utils \
  device-mapper-persistent-data \
  lvm2

yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

yum install docker-ce  -y
echo "docker安装完成"
systemctl start docker
systemctl enable docker
echo "正在安装docker-compose"
curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
echo "docker-compose安装完成"
docker-compose --version
docker info
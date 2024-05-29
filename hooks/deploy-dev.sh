echo Deploy Project

# 获取最新版代码
git pull
echo 代码更新成功
# docker-compose up -d --force-recreate --build
# 强制重新编译容器
sudo docker-compose down
echo docker服务停止



sudo docker-compose up -d --force-recreate --build
echo docker服务部署成功
# 定制镜像 Dockerfile
# docker build -t myapp:pm2 ./backend

# 重启启动容器
# docker stop myoffice
# docker rm myoffice
# docker run --name myoffice -p 3000:3000  -d myoffice:pm2
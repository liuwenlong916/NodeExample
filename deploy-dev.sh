echo Deploy Project

# 获取最新版代码
git pull
# docker-compose up -d --force-recreate --build
# 强制重新编译容器
docker-compose down
docker-compose up -d --force-recreate --build

# 定制镜像 Dockerfile
# docker build -t myapp:pm2 ./backend

# 重启启动容器
# docker stop myoffice
# docker rm myoffice
# docker run --name myoffice -p 3000:3000  -d myoffice:pm2
date >> deploy.log
echo "Deploy Project"

# 获取最新版代码
git pull
if [ $? -ne 0 ]; then
    echo "git pull failed" >> deploy.log
    echo "git pull failed. Check deploy.log for details."
    exit 1
fi
echo "代码更新成功" >> deploy.log

# 强制重新编译容器
sudo docker-compose down

# 删除无用镜像
 echo y | sudo docker image prune

# sudo docker rmi nodeexample_app-pm2
# echo "原始镜像删除" >> deploy.log

sudo docker-compose up -d --force-recreate --build
if [ $? -eq 0 ]; then
    echo "docker服务部署成功" >> deploy.log
else
    echo "docker-compose up failed" >> deploy.log
    echo "docker-compose up failed. Check deploy.log for details."
    exit 1
fi
echo "结束时间:" >> deploy.log
date >> deploy.log
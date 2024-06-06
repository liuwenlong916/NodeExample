echo "Deploy Project : $(date +%Y/%m/%d_%H:%M:%S)" 

# 获取最新版代码
git pull
if [ $? -ne 0 ]; then
    echo "git pull failed"
    git pull
    if [ $? -ne 0 ]; then
        echo "git pull failed" 
        exit 1
    fi
fi
echo "代码更新成功" 

# 强制重新编译容器
sudo docker-compose down

# 删除无用镜像
echo y | sudo docker image prune
# sudo docker rmi nodeexample_app-pm2
# echo "原始镜像删除"

sudo docker-compose up -d --force-recreate --build
if [ $? -eq 0 ]; then
    echo "docker服务部署成功" 
else
    echo "docker-compose up failed. "
    echo "异常信息: $?"
    exit 1
fi
echo "Deployed project : $(date +%Y/%m/%d_%H:%M:%S)" 

echo "======================" 
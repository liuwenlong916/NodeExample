FROM node:14-alpine
#移动当前目录下面的文件到app目录下
ADD . /app/
#进入到app目录下面，类似cd
WORKDIR /app
#安装依赖
RUN npm install
#对外暴露的端口
EXPOSE 3000
#程序启动脚本
CMD ["node", "./bin/www"]


# FROM node:14-alpine
# #移动当前目录下面的文件到app目录下
# ADD . /webhooks/
# #进入到app目录下面，类似cd
# WORKDIR /webhooks
# #对外暴露的端口
# EXPOSE 7777
# #程序启动脚本
# CMD ["node", "./webHook.js"]
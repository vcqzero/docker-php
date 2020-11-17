# 使用指南

第一步 Mysql设置
```shell
# 在docker-composer修改
...
db
  environment: 
    # 设置mysql root 密码
    - MYSQL_ROOT_PASSWORD=123456
  volumes:
    # 定义数据挂载券 
    - your_data_path:/var/lib/mysql
...
```

第二步 Nginx设置

```shell
nginx:
    image: nginx
    container_name: nginx
    ports: 
      - 8000:80
    volumes: 
      # 设置conf.d目录和应用程序目录
      - your_path/conf.d:/etc/nginx/conf.d
      - your_application_path:/var/www/jjhy-api

# 修改conf.d目录下server中root为正确目录
```
第三步 设置php
```shell
php
  volumes: 
    # 设置应用程序目录
    # 此目录必须和ngin中一致
    - /Users/qinchong/workplace/jjhy/jjhy-api:/var/www/jjhy-api
```

第四步 启动

```shell
# 启动
docker-composer up -d

# 关闭
docker-composer down

# 进入php container
docker-composer exec [php/nginx/mysql] /bin/bash

# 查看容器呢启动的进程
ps -ef 
```
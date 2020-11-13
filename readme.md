# 使用指南

## 修改php.ini
在Dockerfile中修改
```shell
# 添加php.ini文件
# 根据生产环境和开发环境，设置要使用的php.ini文件；
COPY php.ini-development /usr/local/etc/php/php.ini
```

## nginx中server
在docker-composer文件中挂载项目，并在nginx server中修改配置
**配置修改最好在创建image之前**

## 启动

```shell
# 启动
docker-composer up -d
# 关闭
docker-composer down
# 进入php container
docker-composer exec web /bin/bash
```
# 使用指南

## Mysql
mysql版本：5.7
端口：`3306->3306`
php内访问：`host.docker.internal:3306`
用户名；
```
username: root
password: 在docker-compose.yml中db->MYSQL_ROOT_PASSWORD字段指定
```
mysql数据目录挂载到宿主主机？？？

## Nginx
**配置文件**
+ 可在`conf.d`目录下新增 `*.conf` server配置文件,对应着Nginx中的server；
+ 名称必须以conf结尾;
+ 修改server中root目录

## PHP
+ 端口:`9000->9000`
+ php容器内项目路径必须和Nginx中的项目路径完全一样；
+ 已安装composer,未设置国内镜像；
+ 进入容器`docker-compose exec php /bin/bash`

设置权限目录可读写？？？
## 启动

```shell
# 启动
docker-composer up -d
# 关闭
docker-composer down
# 进入php container
docker-composer exec [php/nginx/mysql] /bin/bash
```

## 其他命令

```shell
ps -ef # 查看容器呢启动的进程
```
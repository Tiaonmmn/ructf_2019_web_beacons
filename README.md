# RuCTF 2019 Beacons

## 题目详情

- **RuCTF 2019 Beacons**

## 考点

- 一大堆


## 环境重点
- Python 3.6+Mongodb。
- 实际环境没接触到，开放的平台信息上用的是Ansible，我给手动转成Docker了。
- phusion/baseimage。
- PHP版本必须为7.0
- 供选手登录的账户信息写在Dockerfile的ENV username和ENV password下，root用户密码为ENV rootpassword，MySQL的root密码为ENV mysqlrootpassword
- 开放root用户登录ssh
- data.sql在/var/www/html/下

## 启动

    docker-compose up -d
    Web Server is 80 port at http://127.0.0.1:9654/
    Openssh Server is 22 port at tsctf@127.0.0.1:9655

## 版权

该题目复现环境尚未取得主办方及出题人相关授权，如果侵权，请联系本人删除（tiaonmmn@live.cn）

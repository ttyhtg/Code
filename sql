practice 1 
介绍与安装
实验环境：
Ubuntu linux 16.04 64位
MySQL 5.7.22;Xfce;Gedit

安装：
sudo service mysql start
如果提示：mysql: unrecognized service
需要继续安装

MySQL 安装配置
#安装MySQL 服务端、核心程序
sudo apt-get install mysql-server

#安装MySQL 客户端
sudo apt-get install mysql-client
用命令验证是否安装并启动成功
sudo netstat -tap|grep mysql
如果出现如下提示则说明安装成功
![成功](https://doc.shiyanlou.com/MySQL/sql-01-02.png/wm)
根据需求用gedit修改配置文件：
sudo gedit /etc/mysql/my.cnf
完成

3.3 尝试MySQL
1、打开
 # 启动MySQL服务
 sudo service mysql start             

# 使用 root 用户登录，实验楼环境密码为空，直接回车就可以登录
mysql -u root
![done](https://doc.shiyanlou.com/MySQL/sql-01-03-.png/wm)

2、查看数据库 show databases;
![](https://doc.shiyanlou.com/MySQL/sql-01-04.png/wm)
3、连接数据库
use < 数据库名 >

4、查看表
show tables;
不要漏掉；
5、退出 quit 或 exit

实验2 创建数据库并插入数据
基本数据类型 插入数据
实验环境 MySQL 5.7.22
Xfce 终端

二、开发准备
# 打开MySQL 服务
sudo service mysql start

# 使用root用户登录，密码为空
mysql -u root
实验步骤
3.1 新建数据库
语句格式： CREATE DATABASE <数据库名字>;  勿忘分号 CREATE DATABASE 亦可小写
create database mysql_shiyan;

尽管系统不区分大小写，但是为了严谨，我们把保留字（reserved Word）大写，把变量和数据小写

3.2 连接数据库
use mysql_shiyan;

show tables;

3.3 数据表
数据库只是一个框架，表才是实质内容
一个数据库中一般会有多张表，这些各自独立的表通过
建立关系被连接起来，才成为而已交叉查询、一目了然的数据库。
ID  name    phone
01  Tom 110110110
02  Jack    119119119
03  Rose    114114114

3.4 新建数据表
格式如下：
CREATE TABLE 表的名字
（
列名a 数据类型（数据长度），
列名b 数据类型（数据长度），
列名c 数据类型（数据长度）
）；

CREATE TABLE employee (id int(10),name char(20),phone int(12));

在创建一张表 department，包含名称和电话信息，想让命令看起来更整洁，可以这样输入命令
 https://doc.shiyanlou.com/MySQL/sql-02-04.png/wm

 查看刚才添加的两张表：show tables;  勿忘：

 3.5 数据类型


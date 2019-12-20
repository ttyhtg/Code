*linux 基本命令
*通配符的使用
*查看帮助文档

**1）重要的快捷键
Tab 进行命令补全、目录、命令参数
ctrl+c 终止当前程序
ctrl+d 键盘输入结束或退出终端
Ctrl+s 暂停当前程序，暂停后按任意键恢复运行
Ctrl+z 将当前程序放到后台运行，恢复到前台命令为 fg
ctrl+a 将光标移至输入行头，相当于home键
Ctrl+e 将光标一直输入行末，相当于End键
Ctrl+k 删除从光标所在位置到行末

**2)学会利用历史输入命令
键盘上 方向 上键 

**3）学会使用通配符
* ?
|字符	 |含义|
|：----|---：|
|*	|匹配 0 或多个字符|
|?	|匹配任意一个字符|
|[list]	|匹配 list 中的任意单一字符|
|[^list]	|匹配 除list 中的任意单一字符以外的字符|
|[c1-c2]	|匹配 c1-c2 中的任意单一字符 如：[0-9] [a-z]|
|{string1,string2,...}	|匹配 string1 或 string2 (或更多)其一字符串|
|{c1..c2}	|匹配 c1-c2 中全部字符 如{1..10}|

4)学会在命令行中获取帮助
man 命令 
man <command_name>
man man
man 1 ls 
搜索
/<你要搜索的内容>
搜索结果 用 n 切换
shift + n 为上一个关键词所在 Space 即空格键 翻页 Enter向下滚动一行，k,j(vim编辑器的移动键)向前向后滚动。
h 键显示帮助 q 退出

info命令详细帮助 --help 快速查看具体参数的作用

sudo apt-get update
sudo apt-get install sysvbanner
sudo apt-get install toilet
sudo apt-get install figlet

实验3 用户及文件权限管理
who am i 
who mam likes
查看当前用户的用户名 直接 whoami
who 命令其他常用参数

参数 说明
-a   打印能打印的全部
-d   打印死掉的进程
-m   同am i ,mom likes
-q   打印当前登录用户数及用户名
-u   打印当前登录用户登录信息
-r   打印运行等级

2.1 查看用户
2.2 创建用户
sudo adduser lilei
root账户拥有整个系统至高无上的权利
su su- sudo
su <user> 切换到用户user 
sudo <cmd> 以特权命令级别运行cmd命令
su - <user> 也是切换用户，同时环境变量也会跟着改变成目标用户的环境变量
2.3 用户组
在 Linux 里面如何知道自己属于哪些用户组呢？

方法一：使用 groups 命令
 groups shiyanlou
 回车结果 冒号之前表示用户，后面表示该用户所属的用户组
 
 方法二：查看 /etc/group 文件
  cat /etc/group | sort
  过滤结果
  cat /etc/group | grep -E "shiyanlou"
  /etc/group 文件格式说明
  /etc/group 的内容包括用户组（Group）、用户组口令、GID 及该用户组所包含的用户（User），每个用户组一条记录。格式如下：
group_name:password:GID:user_list
 使用 usermod 命令可以为用户添加用户组
sudo usermod -G sudo lilei
删除用户
sudo deluser lilei --remove-home

三、Linux 文件权限
查看文件权限
ls -l
ls -lh 查看文件大小
ls . 当前目录
ls .. 上一级目录
ls -A 查看所有文件 包括隐藏文件
ls -Al
ls -dl 查看目录完整属性
ls -AsSh

3.2 变更文件所有者
sudo chown shiyanlou iphone6

3.3 修改文件权限 
方法一：二进制数字表示
r2w1x0 1*2**2+1*2**1+1*2**0=7
方法二：加减赋值操作
chmod go-rw iphone6
g = groups o = others u = user +-分别表示增加和去掉相应的权限

四、Linux目录结构 文件基本操作
每个目录大体内容
文件的属性
touch file rm mv 等基本命令
目录结构
1、FHS 标准
sudo apt-get update
sudo apt-get install tree
                  可分享的shareable      不可分享的unshareable
不可变的static   /usr 软件放置处         /etc 配置文件
                 /opt 第三方软件         /boot 开机及内核文件
可变动的variable /var/mail 用户邮件信箱 /var/run 程序相关
                 /var/news 新闻组       /var/lock 文件锁相关

2、目录路径
ls -a 查看包括隐藏文件在内的所有文件
- 表示上一次所在目录
～表示当前用户的home目录
pwd 获取当前的绝对路径
cd .. 进入上一级目录
cd ~ 或 cd /home/<你的用户名> 进入你的home目录
以home目录为起点 
cd /usr/local/bin #绝对目录
cd ../../usr/local/bin 相对目录

三、Linux文件的基本操作
1、新建
touch 创建空白文件
mkdir 创建空白目录
mkdir -p father/son/grandson #创建多级目录
touch {1..10}.txt  批量创建文件
2、复制文件
cp test father/son/grandson
复制目录：需要加上 -r 或 -R 表示递归复制，株连九族
cd /home/shiyanlou
mkdir family
cp -r father family
删除文件：rm (remove files or directories)
rm test
删除只读权限的文件：rm -f test

删除目录: rm -r family

4、移动文件与文件重命名
移动文件： mv (move or rename files) mv 源目录文件 目的目录
mkdir Documents
touch file1
mv file1 Documents
重命名文件： mv 旧的文件名 新的文件名
mv file1 myfile
批量重命名： rename 
rename 's/\.txt/\.c/' *.txt  后缀改为.c结尾
rename 'y/a-z/A-Z/' *.c  文件名和后缀名改为大写

5、查看文件
cat 标准输出 正序显示
tac 标准输出 倒序显示 
nl 添加行号并打印
nl 常用的几个参数
-b : 指定添加行号的方式，主要有两种：
    -b a:表示无论是否为空行，同样列出行号("cat -n"就是这种方式)
    -b t:只列出非空行的编号并列出（默认为这种方式）
-n : 设置行号的样式，主要有三种：
    -n ln:在行号字段最左端显示
    -n rn:在行号字段最右边显示，且不加 0
    -n rz:在行号字段最右边显示，且加 0
-w : 行号字段占用的位数(默认为 6 位)
使用more less 命令分页查看文件
more passwd：Enter向下滚动一行，Space向下滚动一屏，h 帮助，q退出
man 手册 vi编辑器

head tail命令查看文件
默认显示头十行和后几行
tail /etc/passwd 新用户的信息在最后一行
tail -n 1 /etc/passwd：只看最后一行
tail -f 不停读取某个文件的内容 实时监视

6、查看文件类型 
file /bin/ls
7、编辑文件
编辑器：emacs、vim、nano
vimtutor 直接使用Linux内部的vim学习教程

Practice 5 环境变量与文件查找
1、环境变量
$ temp=shiyanlou
$ export temp_env=shiyanlou
$ env|sort>env.txt
$ export|sort>export.txt
$ set|sort>set.txt

$ vimdiff env.txt export.txt set.txt

.profile 可以用 ls -a 查看
cd /home/shiyanlou
ls -a 

2. 命令的查找路径与顺序
查看path环境变量的内容
$ echo $PATH
创建shell 脚本
$ cd /home/shiyanlou
$ touch hello_shell.sh
$ gedit hello_shell.sh
添加内容
#!/bin/bash

for ((i=0; i<10; i++));do
    echo "hello shell"
done

exit 0

$ chmod 755 hello_shell.sh

$ cd /home/shiyanlou
$ ./hello_shell.sh
创建一个 C 语言“ hello world ”程序
$ cd /home/shiyanlou
$ gedit hello_world.c

#include <stdio.h>

int main(void)
{
    printf("hello world!\n");
    return 0;
}


$ gcc -o hello_world hello_world.c

$ cd /home/shiyanlou
$ mkdir mybin
$ mv hello_shell.sh hello_world mybin/
运行
$ cd mybin
$ ./hello_shell.sh
$ ./hello_world
3. 添加自定义路径到“ PATH ”环境变量
$ PATH=$PATH:/home/shiyanlou/mybin
$ echo "PATH=$PATH:/home/shiyanlou/mybin" >> .zshrc
上述命令中 >> 表示将标准输出以追加的方式重定向到一个文件中，注意前面用到的 > 是以覆盖的方式重定向到一个文件中，使用的时候一定要注意分辨。在指定文件不存在的情况下都会创建新的文件。

变量设置方式	说明
${变量名#匹配字串}	从头向后开始匹配，删除符合匹配字串的最短数据
${变量名##匹配字串}	从头向后开始匹配，删除符合匹配字串的最长数据
${变量名%匹配字串}	从尾向前开始匹配，删除符合匹配字串的最短数据
${变量名%%匹配字串}	从尾向前开始匹配，删除符合匹配字串的最长数据
${变量名/旧的字串/新的字串}	将符合旧字串的第一个字串替换为新的字串
${变量名//旧的字串/新的字串}	将符合旧字串的全部字串替换为新的字串
$ path=$PATH
$ echo $path
$ path=${path%/home/shiyanlou/mybin}
# 或使用通配符,*表示任意多个任意字符
$ path=${path%*/mybin}
$ unset temp  #这是变量删除
5、如何让环境变量立即生效
cd /home/shiyanlou
source .zshrc
或 . 命令
$ . ./.zshrc
注意的第一个点后面的空格
三、搜索文件
whereis which find locate
whereis 简单快速
whereis who 
whereis find

locate 快而全
sudo apt-get update
sudo apt-get install locate
locate /etc/sh

locate /usr/share/\*.jpg
统计数目 加上 -c 
忽略大小写 -i 

which 小而精
which man

find 精而细
最强大 find [path] [option][action]
sudo find /etc/ -name interfaces

参数    说明
-atime  最后访问时间
-ctime  最后修改文件内容的时间
-mtime  最后修改文件属性的时间

-mtime n: n为数字，表示在n天之前的“一天之内”修改过的文件
-mtime +n: 列出n天之前（不包含n本身）被修改过的文件件
-mtime -n:列出n天之内（包含n本身）被修改过的文件
-newer file:file为一个已存在的文件，列出比file还要新的文件
$find ~ -mtime 0  #列出home目录，当天（24小时之内）有改动的文件
$find ~ -newer /home/shiyanlou/Code #列出home目录下比Code文件夹新的文件

四、更多
amatrix 
sudo apt-get update;sudo apt-get install cmatrix
cmatrix -C red  #改变代码颜色

Prcatice 6 文件打包与解压缩：zip命令 tar命令 压缩与解压常用组合
文件后缀名	说明
*.zip	zip 程序打包压缩的文件
*.rar	rar 程序压缩的文件
*.7z	7zip 程序压缩的文件
*.tar	tar 程序打包，未压缩的文件
*.gz	gzip 程序（GNU zip）压缩的文件
*.xz	xz 程序压缩的文件
*.bz2	bzip2 程序压缩的文件
*.tar.gz	tar 打包，gzip 程序压缩的文件
*.tar.xz	tar 打包，xz 程序压缩的文件
*tar.bz2	tar 打包，bzip2 程序压缩的文件
*.tar.7z	tar 打包，7z 程序压缩的文件
三、实战
打包文件夹
$ cd /home/shiyanlou
$ zip -r -q -o shiyanlou.zip /home/shiyanlou/Desktop
$ du -h shiyanlou.zip
$ file shiyanlou.zip
-r 参数表示递归打包包含子目录的全部内容，-q 参数表示为安静模式，即不向屏幕输出信息，-o，表示输出文件，需在其后紧跟打包输出文件名。后面使用 du 命令查看打包后文件的大小

设置压缩级别为 9 和 1（9 最大，1 最小），重新打包：
$ zip -r -9 -q -o shiyanlou_9.zip /home/shiyanlou/Desktop -x ~/*.zip
$ zip -r -1 -q -o shiyanlou_1.zip /home/shiyanlou/Desktop -x ~/*.zip
 -x 是为了排除我们上一次创建的 zip 文件，否则又会被打包进这一次的压缩文件中，注意：这里只能使用绝对路径，否则不起作用。
 用 du 命令分别查看默认压缩级别、最低、最高压缩级别及未压缩的文件的大小
 $ du -h -d 0 *.zip ~ | sort
 
 创建加密 zip 包
 $ zip -r -e -o shiyanlou_encryption.zip /home/shiyanlou/Desktop
 为了能够在Windows电脑上顺利解压，需要修正命令
 $ zip -r -l -o shiyanlou.zip /home/shiyanlou/Desktop
 
 3.2 使用 unzip 命令解压缩 zip 文件
将 shiyanlou.zip 解压到当前目录：
$ unzip shiyanlou.zip

使用安静模式，将文件解压到指定目录：
$ unzip -q shiyanlou.zip -d ziptest

上述指定目录不存在，将会自动创建。如果你不想解压只想查看压缩包的内容你可以使用 -l 参数：
$ unzip -l shiyanlou.zip

使用 -O（英文字母，大写 o）参数指定编码类型：
unzip -O GBK 中文压缩文件.zip

3.3 tar 打包工具
创建一个 tar 包：
$ cd /home/shiyanlou
$ tar -P -cf shiyanlou.tar /home/shiyanlou/Desktop
-P 保留绝对路径符，-c 表示创建一个 tar 包文件，-f 用于指定创建的文件名，注意文件名必须紧跟在 -f 参数之后，比如不能写成 tar -fc shiyanlou.tar，可以写成 tar -f shiyanlou.tar -c ~。你还可以加上 -v 参数以可视的的方式输出打包的文件

解包一个文件（-x 参数）到指定路径的已存在目录（-C 参数）
$ mkdir tardir
$ tar -xf shiyanlou.tar -C tardir

只查看不解包文件 -t 参数：
$ tar -tf shiyanlou.tar

保留文件属性（-p 参数）和跟随链接（-h 参数）（符号链接或软链接）
$ tar -cphf etc.tar /etc

我们只需要在创建 tar 文件的基础上添加 -z 参数，使用 gzip 来压缩文件
$ tar -czf shiyanlou.tar.gz /home/shiyanlou/Desktop

解压 *.tar.gz 文件
$ tar -xzf shiyanlou.tar.gz

压缩文件格式	参数
*.tar.gz	-z
*.tar.xz	-J
*tar.bz2	-j

总结常用命令：
zip：
打包 ：zip something.zip something （目录请加 -r 参数）
解包：unzip something.zip
指定路径：-d 参数
tar：
打包：tar -cf something.tar something
解包：tar -xf something.tar
指定路径：-C 参数

Practice 7
1.2 df du mount 命令的使用；磁盘相关知识的学习
基本操作： 
df 查看磁盘容量
df -h 
使用du命令查看目录的容量
du  加上-h更易读

-d 查看目录深度
只看一级目录信息：du -h -d 0 ~
查看二级目录信息：du -h -d 1 ~

常用参数
du -h #同--human-readable 以K，M，G为单位，提高信息的可读性。
du -a #同--all 显示目录中所有文件的大小。
du -s #同--summarize 仅显示总计，只列出最后加总的值。
来自: http://man.linuxde.net/du
三、简单的磁盘管理
初学者建议在虚拟环境中进行操作
3.1 创建虚拟磁盘
用dd命令从标准输入读入用户的输入到标准输出或者一个文件中
# 输出到文件
$ dd of=test bs=10 count=1 # 或者 dd if=/dev/stdin of=test bs=10 count=1
# 输出到标准输出
$ dd if=/dev/stdin of=/dev/stdout bs=10 count=1
# 注
在打完了这个命令后，继续在终端打字，作为你的输入

上述命令从标准输入设备读入用户输入（缺省值，所以可省略）然后输出到 test 文件，bs（block size）用于指定块大小（缺省单位为 Byte，也可为其指定如'K'，'M'，'G'等单位），count用于指定块数量。如上图所示，我指定只读取总共 10 个字节的数据，当我输入了“hello shiyanlou”之后加上空格回车总共 16 个字节（一个英文字符占一个字节）内容，显然超过了设定大小。使用du和cat命令看到的写入完成文件实际内容确实只有 10 个字节（那个黑底百分号表示这里没有换行符）,而其他的多余输入将被截取并保留在标准输入。

dd在拷贝的同时还可以实现数据转换，那下面就举一个简单的例子：将输出的英文字符转换为大写再写入文件：
$ dd if=/dev/stdin of=test bs=10 count=1 conv=ucase
可以在man文档中查看其他所有转换参数

使用 dd 命令创建虚拟镜像文件
从/dev/zero设备创建一个容量为 256M 的空文件
$ dd if=/dev/zero of=virtual.img bs=1M count=256
$ du -h virtual.img

使用 mkfs 命令格式化磁盘（我们这里是自己创建的虚拟磁盘镜像）：可以在命令行输入 sudo mkfs 然后按下Tab键，你可以看到很多个以 mkfs 为前缀的命令，这些不同的后缀其实就是表示着不同的文件系统，可以用 mkfs 格式化成的文件系统
用下面的命令来将我们的虚拟磁盘镜像格式化为ext4文件系统
$ sudo mkfs.ext4 virtual.img

知道 Linux 支持哪些文件系统你可以输入ls -l /lib/modules/$(uname -r)/kernel/fs

使用 mount 命令挂载磁盘到目录树
Linux/UNIX 命令行的 mount 指令是告诉操作系统，对应的文件系统已经准备好，可以使用了，而该文件系统会对应到一个特定的点（称为挂载点）。挂载好的文件、目录、设备以及特殊文件即可提供用户使用。
$ sudo mount
输出的结果中每一行表示一个设备或虚拟设备,每一行最前面是设备名，然后是 on 后面是挂载点，type 后面表示文件系统类型，再后面是挂载选项（比如可以在挂载时设定以只读方式挂载等等）。

mount命令的一般格式如下：
mount [options] [source] [directory]

一些常用操作
mount [-o [操作选项]] [-t 文件系统类型] [-w|--rw|--ro] [文件系统源] [挂载点]

挂载我们创建的虚拟磁盘镜像到/mnt目录：
$ mount -o loop -t ext4 virtual.img /mnt 
# 也可以省略挂载类型，很多时候 mount 会自动识别

# 以只读方式挂载
$ mount -o loop --ro virtual.img /mnt
# 或者mount -o loop,ro virtual.img /mnt

使用 umount 命令卸载已挂载磁盘
# 命令格式 sudo umount 已挂载设备名或者挂载点，如：
$ sudo umount /mnt

使用 fdisk 为磁盘分区
# 查看硬盘分区表信息
$ sudo fdisk -l

# 进入磁盘分区模式
$ sudo fdisk virtual.img
首先应先规划好我们的分区方案，这里我将在使用 128M（可用 127M 左右）的虚拟磁盘镜像创建一个 30M 的主分区剩余部分为扩展分区包含 2 个大约 45M 的逻辑分区。

操作完成后输入p查看结果如下:
最后不要忘记输入w写入分区表

使用 losetup 命令建立镜像与回环设备的关联
$ sudo losetup /dev/loop0 virtual.img
# 如果提示设备忙你也可以使用其它的回环设备，"ls /dev/loop*"参看所有回环设备

# 解除设备关联
$ sudo losetup -d /dev/loop0

使用mkfs格式化各分区（前面我们是格式化整个虚拟磁盘镜像文件或磁盘），不过格式化之前，我们还要为各分区建立虚拟设备的映射，用到kpartx工具，需要先安装
$ sudo apt-get install kpartx
$ sudo kpartx -av /dev/loop0

# 取消映射
$ sudo kpartx -dv /dev/loop0

接着再是格式化，我们将其全部格式化为 ext4
$ sudo mkfs.ext4 -q /dev/mapper/loop0p1
$ sudo mkfs.ext4 -q /dev/mapper/loop0p5
$ sudo mkfs.ext4 -q /dev/mapper/loop0p6

格式化完成后在/media目录下新建四个空目录用于挂载虚拟磁盘：
$ mkdir -p /media/virtualdisk_{1..3}
# 挂载磁盘分区
$ sudo mount /dev/mapper/loop0p1 /media/virtualdisk_1
$ sudo mount /dev/mapper/loop0p5 /media/virtualdisk_2
$ sudo mount /dev/mapper/loop0p6 /media/virtualdisk_3

# 卸载磁盘分区
$ sudo umount /dev/mapper/loop0p1
$ sudo umount /dev/mapper/loop0p5
$ sudo umount /dev/mapper/loop0p6
然后：
$ df -h

轻松一下：
cowsay命令，可以让你在终端里以一种动物说话的形式打印出一段话
# 更新软件包
$ sudo apt update

# 安装
$ sudo apt install -y cowsay

# 默认是一只牛
$ cowsay hello shiyanlou

# 加上'-l'参数打印所有支持的动物（其实不只是动物）种类
$ cowsay -l

# 使用'-f'参数选择动物种类
$ cowsay -f elephant hello shiyanlou

# 安装 fortune-zh
$ sudo apt-get install fortune-zh

# 此外它还可以结合我们之前的作业讲过的 fortune 命令一起使用
$ /usr/games/fortune | cowsay -f daemon

实验8 Linux下的帮助命令
內建命令 外部命令 help man info 使用及区别
使用type命令来区分 
1、help命令
bash
help ls
显示错误，因为help适用于显示shell內建命令的简要帮助信息
ls --help
man ls

3.info 命令
info ls
info工具更完整

实验9 Linux任务计划crontab
crontab 语法
# Example of job definition:
# .---------------- minute (0 - 59)
# |  .------------- hour (0 - 23)
# |  |  .---------- day of month (1 - 31)
# |  |  |  .------- month (1 - 12) OR jan,feb,mar,apr ...
# |  |  |  |  .---- day of week (0 - 6) (Sunday=0 or 7) OR sun,mon,tue,wed,thu,fri,sat
# |  |  |  |  |
# *  *  *  *  * user-name command to be executed

2.2crontanb准备
启动rsyslog ，本地已经默认启动
sudo apt-get install -y rsyslog
sudo service rsyslog start

sudo cron －f &

2.3 crontab 使用
crontab -e
选择第二个基本的 vim 就可以了

详细的格式可以使用上一节中学习到的 man 命令查看:man crontab
在/home/shiyanlou目录下创建一个以当前的年月日时分秒为名字的空白文件
*/1 * * * * touch /home/shiyanlou/$(date +\%Y\%m\%d\%H\%M\%S)
注意 “ % ” 在 crontab 文件中，有结束命令行、换行、重定向的作用，前面加 ” \ ” 符号转义，否则，“ % ” 符号将执行其结束命令行或者换行的作用，并且其后的内容会被做为标准输入发送给前面的命令。

2种方式来确定我们的 cron 是否成功的在后台启动，
ps aux | grep cron

or

pgrep cron

通过 ll 查看生成了多少

通过这样一个命令可以查看到执行任务命令之后在日志中的信息反馈
sudo tail -f /var/log/syslog

不需要可删除任务：crontab -r
三、crontab 的深入
每个用户使用 crontab -e 添加计划任务，都会在 /var/spool/cron/crontabs 中添加一个该用户自己的任务文档，这样目的是为了隔离。
如果是系统级别的定时任务，应该如何处理？只需要以 sudo 权限编辑 /etc/crontab 文件就可以。
cron 服务监测时间最小单位是分钟，所以 cron 会每分钟去读取一次 /etc/crontab 与 /var/spool/cron/crontabs 里面的內容。
每个目录的作用：

/etc/cron.daily，目录下的脚本会每天执行一次，在每天的6点25分时运行；
/etc/cron.hourly，目录下的脚本会每个小时执行一次，在每小时的17分钟时运行；
/etc/cron.monthly，目录下的脚本会每月执行一次，在每月1号的6点52分时运行；
/etc/cron.weekly，目录下的脚本会每周执行一次，在每周第七天的6点47分时运行；
系统默认执行时间可以根据需求进行修改。
挑战：备份日志
为 shiyanlou 用户添加计划任务
每天凌晨 3 点的时候定时备份 alternatives.log 到 /home/shiyanlou/tmp/ 目录
命名格式为 年-月-日，比如今天是2017年4月1日，那么文件名为 2017-04-01

sudo cron -f &
crontab -e 添加
0 3 * * * sudo rm /home/shiyanlou/tmp/*
0 3 * * * sudo cp /var/log/alternatives.log /home/shiyanlou/tmp/$(date +\%Y-\%m-\%d)

实验 10
命令执行顺序控制与管道
cut，grep，wc，sort命令的使用
管道的理解
2.1 顺序执行多条命令
之前：
$ sudo apt-get update
# 等待——————————然后输入下面的命令
$ sudo apt-get install some-tool //这里some-tool是指具体的软件包
# 等待——————————然后输入下面的命令
$ some-tool

现在：
$ sudo apt-get update;sudo apt-get install some-tool;some-tool
# 让它自己运行

2.2 有选择的执行命令
$ which cowsay>/dev/null && cowsay -f head-in ohch~
学习过 C 语言的用户应该知道在 C 语言里面&&表示逻辑与，而且还有一个||表示逻辑或，同样 Shell 也有一个||，它们的区别就在于，shell中的这两个符号除了也可用于表示逻辑与和或之外，就是可以实现这里的命令执行顺序的简单控制。||在这里就是与&&相反的控制效果，当上一条命令执行结果为≠0($?≠0)时则执行它后面的命令：
$ which cowsay>/dev/null || echo "cowsay has not been install, please run 'sudo apt-get install cowsay' to install"

除了上述基本的使用之外，我们还可以结合着&&和||来实现一些操作，比如：
$ which cowsay>/dev/null && echo "exist" || echo "not exist"

三、管道
3.1 试用
查看/etc目录下有哪些文件和目录，使用ls命令来查看：
$ ls -al /etc

有太多内容，屏幕不能完全显示，这时候可以使用滚动条或快捷键滚动窗口来查看。不过这时候可以使用管道：
$ ls -al /etc | less
通过管道将前一个命令(ls)的输出作为下一个命令(less)的输入，然后就可以一行一行地看。

3.2 cut 命令，打印每一行的某一字段
$ cut /etc/passwd -d ':' -f 1,6

打印/etc/passwd文件中每一行的前N个字符：
# 前五个（包含第五个）
$ cut /etc/passwd -c -5
# 前五个之后的（包含第五个）
$ cut /etc/passwd -c 5-
# 第五个
$ cut /etc/passwd -c 5
# 2到5之间的（包含第五个）
$ cut /etc/passwd -c 2-5

3.3 grep 命令，在文本中或 stdin 中查找匹配字符串
grep命令的一般形式为：
grep [命令选项]... 用于匹配的表达式 [文件]...

搜索/home/shiyanlou目录下所有包含"shiyanlou"的文本文件，并显示出现在文本中的行号：
$ grep -rnI "shiyanlou" ~
-r 参数表示递归搜索子目录中的文件,-n表示打印匹配项行号，-I表示忽略二进制文件。这个操作实际没有多大意义，但可以感受到grep命令的强大与实用。

# 查看环境变量中以"yanlou"结尾的字符串
$ export | grep ".*yanlou$"
其中$就表示一行的末尾

3.4 wc 命令，简单小巧的计数工具
wc 命令用于统计并输出一个文件中行、单词和字节的数目，比如输出/etc/passwd文件的统计信息：
$ wc /etc/passwd

分别只输出行数、单词数、字节数、字符数和输入文本中最长一行的字节数：
# 行数
$ wc -l /etc/passwd
# 单词数
$ wc -w /etc/passwd
# 字节数
$ wc -c /etc/passwd
# 字符数
$ wc -m /etc/passwd
# 最长行字节数
$ wc -L /etc/passwd

结合管道来操作一下，下面统计 /etc 下面所有目录数：
$ ls -dl /etc/*/ | wc -l

3.5 sort 排序命令
默认为字典排序：
$ cat /etc/passwd | sort

反转排序：
$ cat /etc/passwd | sort -r

按特定字段排序：
$ cat /etc/passwd | sort -t':' -k 3
上面的-t参数用于指定字段的分隔符，这里是以":"作为分隔符；-k 字段号用于指定对哪一个字段进行排序。这里/etc/passwd文件的第三个字段为数字，默认情况下是以字典序排序的，如果要按照数字排序就要加上-n参数：
$ cat /etc/passwd | sort -t':' -k 3 -n

3.6 uniq 去重命令
uniq命令可以用于过滤或者输出重复行。
过滤重复行
我们可以使用history命令查看最近执行过的命令（实际为读取${SHELL}_history文件,如我们环境中的~/.zsh_history文件），不过你可能只想查看使用了哪个命令而不需要知道具体干了什么，那么你可能就会要想去掉命令后面的参数然后去掉重复的命令：
$ history | cut -c 8- | cut -d ' ' -f 1 | uniq
然后经过层层过滤，你会发现确是只输出了执行的命令那一列，不过去重效果好像不明显，仔细看你会发现它确实去重了，只是不那么明显，之所以不明显是因为uniq命令只能去连续重复的行，不是全文去重，所以要达到预期效果，我们先排序：
$ history | cut -c 8- | cut -d ' ' -f 1 | sort | uniq
# 或者$ history | cut -c 8- | cut -d ' ' -f 1 | sort -u
这就是 Linux/UNIX 哲学吸引人的地方，大繁至简，一个命令只干一件事却能干到最好。

输出重复行
# 输出重复过的行（重复的只输出一个）及重复次数
$ history | cut -c 8- | cut -d ' ' -f 1 | sort | uniq -dc
# 输出所有重复的行
$ history | cut -c 8- | cut -d ' ' -f 1 | sort | uniq -D

shiyanlou:~/ $ sudo apt update
shiyanlou:~/ $ sudo apt install -y aview imagemagick 
shiyanlou:~/ $ wget http://labfile.oss.aliyuncs.com/courses/1/Linus.png
 asciiview [图片文件名] 即可打开图片
 
 实验 11  简单的文本处理
这一节我们将介绍这几个命令tr（注意不是tar），col，join，paste。实际这一节是上一节关于能实现管道操作的命令的延续，所以我们依然将结合管道来熟悉这些命令的使用。
2.1 tr 命令
tr 命令可以用来删除一段文本信息中的某些文字。或者将其进行转换。
使用方式：
tr [option]...SET1 [SET2]
选项	说明
-d	删除和set1匹配的字符，注意不是全词匹配也不是按字符顺序匹配
-s	去除set1指定的在输入文本中连续并重复的字符

操作举例：
# 删除 "hello shiyanlou" 中所有的'o','l','h'
$ echo 'hello shiyanlou' | tr -d 'olh'
# 将"hello" 中的ll,去重为一个l
$ echo 'hello' | tr -s 'l'
# 将输入文本，全部转换为大写或小写输出
$ echo 'input some text here' | tr '[:lower:]' '[:upper:]'
# 上面的'[:lower:]' '[:upper:]'你也可以简单的写作'[a-z]' '[A-Z]',当然反过来将大写变小写也是可以的

更多 tr 的使用，你可以使用--help或者man tr获得。

2.2 col 命令
col 命令可以将Tab换成对等数量的空格键，或反转这个操作。
使用方式：
col [option]
常用的选项有：

选项	说明
-x	将Tab转换为空格
-h	将空格转换为Tab（默认选项）

操作举例：
# 查看 /etc/protocols 中的不可见字符，可以看到很多 ^I ，这其实就是 Tab 转义成可见字符的符号
$ cat -A /etc/protocols
# 使用 col -x 将 /etc/protocols 中的 Tab 转换为空格,然后再使用 cat 查看，你发现 ^I 不见了
$ cat /etc/protocols | col -x | cat -A

2.3 join
将两个文件中包含相同内容的那一行合并到一起
使用方式：
join [option]... file1 file2
常用的选项有：
选项    说明
-t      指定分隔符，默认为空格
-i      忽略大小写的差异
-1      指明第一个文件要用哪个字段来对比，默认对比第一个字段
-2      指明第二个文件要用哪个字段来对比，默认对比第一个字段

操作举例：
$ cd /home/shiyanlou
# 创建两个文件
$ echo '1 hello' > file1
$ echo '1 shiyanlou' > file2
$ join file1 file2
# 将/etc/passwd与/etc/shadow两个文件合并，指定以':'作为分隔符
$ sudo join -t':' /etc/passwd /etc/shadow
# 将/etc/passwd与/etc/group两个文件合并，指定以':'作为分隔符, 分别比对第4和第3个字段
$ sudo join -t':' -1 4 /etc/passwd -2 3 /etc/group

2.4 paste命令
paste这个命令与join 命令类似，它是在不对比数据的情况下，简单地将多个文件合并一起，以Tab隔开。
使用方式：
paste [option] file...

常用的选项有：
选项	说明
-d	指定合并的分隔符，默认为Tab
-s	不合并到一行，每个文件为一行

操作举例：
$ echo hello > file1
$ echo shiyanlou > file2
$ echo www.shiyanlou.com > file3
$ paste -d ':' file1 file2 file3
$ paste -s file1 file2 file3
实验12 数据流重定向
两个重定向基本操作
echo ‘hello shiyanlou’ > redirect
echo 'www.shiyanlou.com' >> redirect
cat redirect

2.1 简单的重定向
stdin stdout stderr
文件描述符 设备文件 说明
0          /dev/stdin 标准输入
1          /dev/stdout 标准输出
2          /dev/stderr 标准错误

将cat的连续输出（heredoc方式）重定向到一个文件
mkdir Documents 
cat > Documents/test.c <<EOF
#include <stdin.h>
int main()
{
    printf("hello world\n");
    return 0;
}

EOF
将一个文件作为命令的输入，标准输出作为命令的输出
cat Documents/test.c
将echo命令通过管道传过来的数据作为cat命令的输入，将标准输出作为命令的输出
echo 'hi' |cat

将echo命令的输出从默认的标准输出重定向到一个普通文件
echo 'hello shiyanlou' > rediredct
cat redirect

2.2 标准错误重定向
#使用cat命令同是读取两个文件，其中一个存在，另一个不存在
cat Documents/test.c hello.c
#可以看到除了正确输出了前一个文件的内容，还在末尾出现了一条错误信息
#下面我们将输出重定向到一个文件
cat Documents/test.c hello.c > somefile

隐藏错误或者警告
将标准错误重定向到标准输出，再将标准输出重定向到文件，注意要将
重定向到文件写到前面
cat Documents/test.c hello.c > somefile 2>&1
或者只用bash提供的特殊的重定向符号”&“将标准错误和标准输出同时
重定向到文件
cat Documents/test.c hello.c &>somefilehell

2.3 使用tee命令同时重定向到多个文件
echo 'hello shiyanlou' |tee hello

2.4 永久重定向 ：exec
#先开启一个子shell
zsh
#使用exec替换当前进程的重定向，将标准输出重定向到一个文件
exec 1>somefile
#后面你执行的命令的输出都将被重定向到文件中，直到你退出当前子shell，
或取消exec的重定向
ls
exit
cat somefile

2.5 创建文件描述符
查看当前shell进程中的打开的文件描述符
cd /dev/fd/ ; ls -AL

使用exec命令可以创建新的文件描述符
zsh
exec 3>somefile
#先进入目录，在查看，否则你可能不能得到正确的结果，
然后再回到上一次的目录
cd /dev/fd/;ls -AL;cd -
#注意下面的命令>与&之间不应搞有空格
echo "this is test" >&3
cat somefile 
exit

2.6 关闭文件描述符
exec 3>&-
cd /dev/fd;ls -Al;cd -

2.7 完全屏蔽命令的输出
cat Documents/test.c 1>/dev/null 2>&1

2.8 使用xargs 分割参数列表
cut -d: -fl < /etc/passwd | sort | xargs echo
上面这个命令用于将/etc/passwd 文件按： 分割取第一个字段排序后，
使用echo命令生成一个列表

轻松一下
sudo apt-get install caca-utils
cacaview <pic_file>
cacademo
cacafire


实验13 正则表达式基础
1.1 实验内容
grep sed awk 三个命令
2.1 举例
shi*

2.2基本语法
选择：|
boy|girl可以匹配boy 或者 girl

数量限定
+ 表示前面的字符必须出现至少一次（一次或者多次）
如：goo+gle 可以匹配goooogle

？表示前面的字符最多出现一次（0次或1次）
如：colou?r 可以匹配 colour 或 color

*号代表前面的字符可以不出现，也可以出现一次或者多次（0次，或1次，或多次）
如：0*42 可以匹配 42、042、0042、00042

范围和优先级

()圆括号可以用来定义模式字符串的范围和优先级，这可以简单的理解为是否将括号内的模式串作为一个整体。
例如，"gr(a|e)y"等价于"gray|grey"，（这里体现了优先级，竖直分隔符用于选择a或者e而不是gra和ey），
"(grand)?father"匹配father和grandfather（这里体现了范围，?将圆括号内容作为一个整体匹配）。

语法（部分）
正则表达式有多种不同的风格，下面列举一些常用的作为 PCRE 子集的适用于perl和python编程语言及grep或
egrep的正则表达式匹配规则：(由于markdown表格解析的问题，下面的竖直分隔符用全角字符代替，实际使用
时请换回半角字符)

字符	 描述
\	    将下一个字符标记为一个特殊字符、或一个原义字符。例如，“n”匹配字符“n”。“\n”匹配一个换行符。
      序列“\\”匹配“\”而“\(”则匹配“(”。
^	    匹配输入字符串的开始位置。
$	    匹配输入字符串的结束位置。
{n}	  n是一个非负整数。匹配确定的n次。例如，“o{2}”不能匹配“Bob”中的“o”，但是能匹配“food”中的两个o。
{n,}	 n是一个非负整数。至少匹配n次。例如，“o{2,}”不能匹配“Bob”中的“o”，但能匹配“foooood”中的所有o。
       “o{1,}”等价于“o+”。“o{0,}”则等价于“o*”。
{n,m}	m和n均为非负整数，其中n<=m。最少匹配n次且最多匹配m次。例如，“o{1,3}”将匹配“fooooood”中的
      前三个o。“o{0,1}”等价于“o?”。请注意在逗号和两个数之间不能有空格。
*	     匹配前面的子表达式零次或多次。例如，zo*能匹配“z”、“zo”以及“zoo”。*等价于{0,}。
+	     匹配前面的子表达式一次或多次。例如，“zo+”能匹配“zo”以及“zoo”，但不能匹配“z”。+等价于{1,}。
?	     匹配前面的子表达式零次或一次。例如，“do(es)?”可以匹配“do”或“does”中的“do”。?等价于{0,1}。
?	     当该字符紧跟在任何一个其他限制符（*,+,?，{n}，{n,}，{n,m}）后面时，匹配模式是非贪婪的。非贪婪模式
尽可能少的匹配所搜索的字符串，而默认的贪婪模式则尽可能多的匹配所搜索的字符串。例如，对于字符串“oooo”，“o+?”将匹配
单个“o”，而“o+”将匹配所有“o”。
.	     匹配除“\n”之外的任何单个字符。要匹配包括“\n”在内的任何字符，请使用像“(.｜\n)”的模式。
(pattern)	匹配pattern并获取这一匹配的子字符串。该子字符串用于向后引用。要匹配圆括号字符，请使用“\(”或“\)”。
x｜y	    匹配x或y。例如，“z｜food”能匹配“z”或“food”。“(z｜f)ood”则匹配“zood”或“food”。
[xyz]	   字符集合（character class）。匹配所包含的任意一个字符。例如，“[abc]”可以匹配“plain”中的“a”。其中特殊字符
仅有反斜线\保持特殊含义，用于转义字符。其它特殊字符如星号、加号、各种括号等均作为普通字符。脱字符^如果出现在首位则表示
负值字符集合；如果出现在字符串中间就仅作为普通字符。连字符 - 如果出现在字符串中间表示字符范围描述；如果出现在首位则仅
作为普通字符。
[^xyz]	   排除型（negate）字符集合。匹配未列出的任意字符。例如，“[^abc]”可以匹配“plain”中的“plin”。
[a-z]	    字符范围。匹配指定范围内的任意字符。例如，“[a-z]”可以匹配“a”到“z”范围内的任意小写字母字符。
[^a-z]	   排除型的字符范围。匹配任何不在指定范围内的任意字符。例如，“[^a-z]”可以匹配任何不在“a”到“z”范围内的任意字符。

优先级
优先级为从上到下从左到右，依次降低：

运算符                    	说明
\	                        转义符
(), (?:), (?=), []	       括号和中括号
*、+、?、{n}、{n,}、{n,m}  	限定符
^、$、\                    任何元字符	定位点和序列
｜	                        选择

3.1 基本操作
grep命令用于打印输出文本中匹配的模式串，它使用正则表达式作为模式匹配的条件。grep支持三种正则表达式引擎，分别用三个参数指定：
参数	说明
-E	POSIX扩展正则表达式，ERE
-G	POSIX基本正则表达式，BRE
-P	Perl正则表达式，PCRE

grep常用参数

参数	说明
-b	     将二进制文件作为文本来进行匹配
-c	     统计以模式匹配的数目
-i	     忽略大小写
-n	     显示匹配文本所在行的行号
-v	     反选，输出不匹配行的内容
-r	     递归匹配查找
-A n	   n为正整数，表示after的意思，除了列出匹配行之外，还列出后面的n行
-B n	   n为正整数，表示before的意思，除了列出匹配行之外，还列出前面的n行
--color=auto	将输出中的匹配项设置为自动颜色显示
注：在大多数发行版中是默认设置了grep的颜色的，你可以通过参数指定或修改GREP_COLOR环境变量。

3.2 使用正则表达式
使用基本正则表达式，BRE
位置
查找/etc/group文件中以"shiyanlou"为开头的行
$ grep 'shiyanlou' /etc/group
$ grep '^shiyanlou' /etc/group

数量
# 将匹配以'z'开头以'o'结尾的所有字符串
$ echo 'zero\nzo\nzoo' | grep 'z.*o'
# 将匹配以'z'开头以'o'结尾，中间包含一个任意字符的字符串
$ echo 'zero\nzo\nzoo' | grep 'z.o'
# 将匹配以'z'开头,以任意多个'o'结尾的字符串
$ echo 'zero\nzo\nzoo' | grep 'zo*'

注意：其中\n为换行符

选择
# grep默认是区分大小写的，这里将匹配所有的小写字母
$ echo '1234\nabcd' | grep '[a-z]'
# 将匹配所有的数字
$ echo '1234\nabcd' | grep '[0-9]'
# 将匹配所有的数字
$ echo '1234\nabcd' | grep '[[:digit:]]'
# 将匹配所有的小写字母
$ echo '1234\nabcd' | grep '[[:lower:]]'
# 将匹配所有的大写字母
$ echo '1234\nabcd' | grep '[[:upper:]]'
# 将匹配所有的字母和数字，包括0-9,a-z,A-Z
$ echo '1234\nabcd' | grep '[[:alnum:]]'
# 将匹配所有的字母
$ echo '1234\nabcd' | grep '[[:alpha:]]'

完整的特殊符号及说明：
特殊符号	说明
[:alnum:]	代表英文大小写字母及数字，亦即 0-9, A-Z, a-z
[:alpha:]	代表任何英文大小写字母，亦即 A-Z, a-z
[:blank:]	代表空白键与 [Tab] 按键两者
[:cntrl:]	代表键盘上面的控制按键，亦即包括 CR, LF, Tab, Del.. 等等
[:digit:]	代表数字而已，亦即 0-9
[:graph:]	除了空白字节 (空白键与 [Tab] 按键) 外的其他所有按键
[:lower:]	代表小写字母，亦即 a-z
[:print:]	代表任何可以被列印出来的字符
[:punct:]	代表标点符号 (punctuation symbol)，亦即：" ' ? ! ; : # $...
[:upper:]	代表大写字母，亦即 A-Z
[:space:]	任何会产生空白的字符，包括空白键, [Tab], CR 等等
[:xdigit:]	代表 16 进位的数字类型，因此包括： 0-9, A-F, a-f 的数字与字节
注意：之所以要使用特殊符号，是因为上面的[a-z]不是在所有情况下都管用，这还与主机当前的语系有关，即设置在LANG环境变量的值，zh_CN.UTF-8的话[a-z]，即为所有小写字母，其它语系可能是大小写交替的如，"a A b B...z Z"，[a-z]中就可能包含大写字母。所以在使用[a-z]时请确保当前语系的影响，使用[:lower:]则不会有这个问题。

# 排除字符
$ $ echo 'geek\ngood' | grep '[^o]'
注意:当^放到中括号内为排除字符，否则表示行首。

使用扩展正则表达式，ERE
要通过grep使用扩展正则表达式需要加上-E参数，或使用egrep。
数量
# 只匹配"zo"
$ echo 'zero\nzo\nzoo' | grep -E 'zo{1}'
# 匹配以"zo"开头的所有单词
$ echo 'zero\nzo\nzoo' | grep -E 'zo{1,}'
注意：推荐掌握{n,m}即可，+,?,*，这几个不太直观，且容易弄混淆。

选择
# 匹配"www.shiyanlou.com"和"www.google.com"
$ echo 'www.shiyanlou.com\nwww.baidu.com\nwww.google.com' | grep -E 'www\.(shiyanlou|google)\.com'
# 或者匹配不包含"baidu"的内容
$ echo 'www.shiyanlou.com\nwww.baidu.com\nwww.google.com' | grep -Ev 'www\.baidu\.com'
注意：因为.号有特殊含义，所以需要转义。

四、sed 流编辑器
sed 命令基本格式：
sed [参数]... [执行命令] [输入文件]...
# 形如：
$ sed -i 's/sad/happy/' test # 表示将test文件中的"sad"替换为"happy"

参数	说明
-n	安静模式，只打印受影响的行，默认打印输入数据的全部内容
-e	用于在脚本中添加多个执行命令一次执行，在命令行中执行多个命令通常不需要加该参数
-f filename	指定执行filename文件中的命令
-r	使用扩展正则表达式，默认为标准正则表达式
-i	将直接修改输入文件内容，而不是打印到标准输出设备

4.2 sed编辑器的执行命令（这里”执行“解释为名词）
sed执行命令格式：
[n1][,n2]command
[n1][~step]command
# 其中一些命令可以在后面加上作用范围，形如：
$ sed -i 's/sad/happy/g' test # g表示全局范围
$ sed -i 's/sad/happy/4' test # 4表示指定行中的第四个匹配字符串

其中n1,n2表示输入内容的行号，它们之间为,逗号则表示从n1到n2行，如果为～波浪号则表示从n1开始以step为步进的所有行；command为执行动作，下面为一些常用动作指令：
命令	说明
s	行内替换
c	整行替换
a	插入到指定行的后面
i	插入到指定行的前面
p	打印指定行，通常与-n参数配合使用
d	删除指定行

4.3 sed操作举例
用于练习的文本文件：
$ cp /etc/passwd ~

打印指定行
# 打印2-5行
$ nl passwd | sed -n '2,5p'
# 打印奇数行
$ nl passwd | sed -n '1~2p'

行内替换
# 将输入文本中"shiyanlou" 全局替换为"hehe",并只打印替换的那一行，注意这里不能省略最后的"p"命令
$ sed -n 's/shiyanlou/hehe/gp' passwd
注意： 行内替换可以结合正则表达式使用。

删除某行
$ nl passwd | grep "shiyanlou"
# 删除第30行
$ sed -i '30d' passwd

五、awk文本处理语言
5.1 awk介绍
AWK是一种优良的文本处理工具，Linux及Unix环境中现有的功能最强大的数据处理引擎之一.其名称得自于它的创始人Alfred Aho（阿尔佛雷德·艾侯）、Peter Jay Weinberger（彼得·温伯格）和Brian Wilson Kernighan（布莱恩·柯林汉)姓氏的首个字母.AWK程序设计语言，三位创建者已将它正式定义为“样式扫描和处理语言”。它允许您创建简短的程序，这些程序读取输入文件、为数据排序、处理数据、对输入执行计算以及生成报表，还有无数其他的功能。最简单地说，AWK是一种用于处理文本的编程语言工具。

$ ll /usr/bin/awk

5.2 awk的一些基础概念
awk所有的操作都是基于pattern(模式)—action(动作)对来完成的，如下面的形式：
$ pattern {action}
你可以看到就如同很多编程语言一样，它将所有的动作操作用一对{}花括号包围起来。其中pattern通常是表示用于匹配输入的文本的“关系式”或“正则表达式”，action则是表示匹配后将执行的动作。在一个完整awk操作中，这两者可以只有其中一个，如果没有pattern则默认匹配输入的全部文本，如果没有action则默认为打印匹配内容到屏幕。
awk处理文本的方式，是将文本分割成一些“字段”，然后再对这些字段进行处理，默认情况下，awk以空格作为一个字段的分割符，不过这不是固定的，你可以任意指定分隔符，下面将告诉你如何做到这一点。

5.3 awk命令基本格式
awk [-F fs] [-v var=value] [-f prog-file | 'program text'] [file...]
其中-F参数用于预先指定前面提到的字段分隔符（还有其他指定字段的方式） ，-v用于预先为awk程序指定变量，-f参数用于指定awk命令要执行的程序文件，或者在不加-f参数的情况下直接将程序语句放在这里，最后为awk需要处理的文本输入，且可以同时输入多个文本文件。

5.4 awk操作体验
先用vim新建一个文本文档
$ vim test
包含如下内容：
I like linux
www.shiyanlou.com

使用awk将文本内容打印到终端
# "quote>" 不用输入
$ awk '{
> print
> }' test
# 或者写到一行
$ awk '{print}' test
在这个操作中我是省略了pattern，所以awk会默认匹配输入文本的全部内容，然后在"{}"花括号中执行动作，即print打印所有匹配项，这里是全部文本内容

将test的第一行的每个字段单独显示为一行
$ awk '{
> if(NR==1){
> print $1 "\n" $2 "\n" $3
> } else {
> print}
> }' test

# 或者
$ awk '{
> if(NR==1){
> OFS="\n"
> print $1, $2, $3
> } else {
> print}
> }' test

说明:你首先应该注意的是，这里我使用了awk语言的分支选择语句if,它的使用和很多高级语言如C/C++语言基本一致，如果你有这些语言的基础，这里将很好理解。另一个你需要注意的是NR与OFS，这两个是awk内建的变量，NR表示当前读入的记录数，你可以简单的理解为当前处理的行数，OFS表示输出时的字段分隔符，默认为" "空格，如上图所见，我们将字段分隔符设置为\n换行符，所以第一行原本以空格为字段分隔的内容就分别输出到单独一行了。然后是$N其中N为相应的字段号，这也是awk的内建变量，它表示引用相应的字段，因为我们这里第一行只有三个字段，所以只引用到了$3。除此之外另一个这里没有出现的$0，它表示引用当前记录（当前行）的全部内容。

将test的第二行的以点为分段的字段换成以空格为分隔
$ awk -F'.' '{
> if(NR==2){
> print $1 "\t" $2 "\t" $3
> }}' test

# 或者
$ awk '
> BEGIN{
> FS="."
> OFS="\t"  # 如果写为一行，两个动作语句之间应该以";"号分开  
> }{
> if(NR==2){
> print $1, $2, $3
> }}' test

说明：这里的-F参数，前面已经介绍过，它是用来预先指定待处理记录的字段分隔符。我们需要注意的是除了指定OFS我们还可以在print 语句中直接打印特殊符号如这里的\t，print打印的非变量内容都需要用""一对引号包围起来。上面另一个版本，展示了实现预先指定变量分隔符的另一种方式，即使用BEGIN，就这个表达式指示了，其后的动作将在所有动作之前执行，这里是FS赋值了新的"."点号代替默认的" "空格

注意:首先说明一点，我们在学习和使用awk的时候应该尽可能将其作为一门程序语言来理解，这样将会使你学习起来更容易，所以初学阶段在练习awk时应该尽量按照我那样的方式分多行按照一般程序语言的换行和缩进来输入，而不是全部写到一行（当然这在你熟练了之后是没有任何问题的）。

5.5 awk常用的内置变量
变量名	说明
FILENAME	当前输入文件名，若有多个文件，则只表示第一个。如果输入是来自标准输入，则为空字符串
$0	当前记录的内容
$N	N表示字段号，最大值为NF变量的值
FS	字段分隔符，由正则表达式表示，默认为" "空格
RS	输入记录分隔符，默认为"\n"，即一行为一个记录
NF	当前记录字段数
NR	已经读入的记录数
FNR	当前输入文件的记录数，请注意它与NR的区别
OFS	输出字段分隔符，默认为" "空格
ORS	输出记录分隔符，默认为"\n"

实验14 Linux下安装软件
在线安装；从磁盘安装deb软件包；从二进制软件包安装；从源代码编译安装

sudo apt-get install w3m
w3m https://www.shiyanlou.com/faq

2.2 apt 包管理工具介绍
这个包管理器包含以 apt- 开头的多个工具，如 apt-get apt-cache apt-cdrom 等，在Debian系列的发行版中使用
软件源镜像服务器
软件源
我们需要定期从服务器上下载一个软件包列表，使用 sudo apt-get update 命令来保持本地的软件包列表是最新的
（有时你也需要手动执行这个操作，比如更换了软件源），而这个表里会有软件依赖信息的记录，对于软件依赖，我举个例子：
我们安装 w3m 软件的时候，而这个软件需要 libgc1c2 这个软件包才能正常工作，这个时候 apt-get 在安装软件的时候
会一并替我们安装了，以保证 w3m 能正常的工作。

2.3 apt-get
apt-get 是用于处理 apt包的公用程序集，我们可以用它来在线安装、卸载和升级软件包等，下面列出一些apt-get包含的常用的一些工具：

工具	         说明
install	     其后加上软件包名，用于安装一个软件包
update	      从软件源镜像服务器上下载/更新用于更新本地软件源的软件包列表
upgrade	     升级本地可更新的全部软件包，但存在依赖问题时将不会升级，通常会在更新之前执行一次update
dist-upgrade	解决依赖关系并升级(存在一定危险性)
remove	      移除已安装的软件包，包括与被移除软件包有依赖关系的软件包，但不包含软件包的配置文件
autoremove	  移除之前被其他软件包依赖，但现在不再被使用的软件包
purge	       与remove相同，但会完全移除软件包，包含其配置文件
clean	       移除下载到本地的已经安装的软件包，默认保存在/var/cache/apt/archives/
autoclean	   移除已安装的软件的旧版本软件包

下面是一些apt-get常用的参数：
参数	         说明
-y	          自动回应是否安装软件包的选项，在一些自动化安装脚本中使用这个参数将十分有用
-s	          模拟安装
-q	          静默安装方式，指定多个q或者-q=#,#表示数字，用于设定静默级别，这在你不想要在安装软件包时屏幕输出过多时很有用
-f	          修复损坏的依赖关系
-d	          只下载不安装
--reinstall	 重新安装已经安装但可能存在问题的软件包
--install-suggests	同时安装APT给出的建议安装的软件包

2.4 安装软件包
关于安装，如前面演示的一样你只需要执行apt-get install <软件包名>即可，除了这一点，
你还应该掌握的是如何重新安装软件包。 很多时候我们需要重新安装一个软件包，比如你的系统被破坏，
或者一些错误的配置导致软件无法正常工作。

你可以使用如下方式重新安装：
$ sudo apt-get --reinstall install w3m

另一个你需要掌握的是，如何在不知道软件包完整名的时候进行安装。通常我们是使用Tab键补全软件包名，
后面会介绍更好的方法来搜索软件包。有时候你需要同时安装多个软件包，你还可以使用正则表达式匹配软件包名进行批量安装

2.5 软件升级
# 更新软件源
$ sudo apt-get update
# 升级没有依赖问题的软件包
$ sudo apt-get upgrade
# 升级并解决依赖关系
$ sudo apt-get dist-upgrade

2.6 卸载软件
同样是一个命令加回车 sudo apt-get remove w3m

# 不保留配置文件的移除
$ sudo apt-get purge w3m
# 或者 sudo apt-get --purge remove
# 移除不再需要的被依赖的软件包
$ sudo apt-get autoremove

2.7 软件搜索
sudo apt-cache search softname1 softname2 softname3……
apt-cache 命令则是针对本地数据进行相关操作的工具，search 顾名思义在本地的数据库中寻找有关 softname1 softname2 …… 相关软件的信息。现在我们试试搜索一下之前我们安装的软件 w3m ，如图：https://doc.shiyanlou.com/document-uid600404labid6129timestamp1523958065018.png/wm

三、使用 dpkg
dpkg 是 Debian 软件包管理器的基础，它被伊恩·默多克创建于 1993 年。dpkg 与 RPM 十分相似，同样被用于安装、卸载和供给和 .deb 软件包相关的信息。
dpkg 本身是一个底层的工具。上层的工具，像是 APT，被用于从远程获取软件包以及处理复杂的软件包关系。"dpkg"是"Debian Package"的简写。
我们经常可以在网络上见到以deb形式打包的软件包，就需要使用dpkg命令来安装。

dpkg常用参数介绍：

参数	说明
-i	安装指定deb包
-R	后面加上目录名，用于安装该目录下的所有deb安装包
-r	remove，移除某个已安装的软件包
-I	显示deb包文件的信息
-s	显示已安装软件的信息
-S	搜索已安装的软件包
-L	显示已安装软件包的目录信息

3.2 使用dpkg安装deb软件包
我们先使用apt-get加上-d参数只下载不安装，下载emacs编辑器的deb包：
$ sudo apt-get update
$ sudo apt-get -d install -y emacs

下载完成后，我们可以查看/var/cache/apt/archives/目录下的内容：ls /var/cache/apt/archives/

然后我们将第一个deb拷贝到 /home/shiyanlou 目录下，并使用dpkg安装
$ cp /var/cache/apt/archives/emacs24_24.5+1-6ubuntu1.1_amd64.deb ~
# 安装之前参看deb包的信息
$ sudo dpkg -I emacs24_24.5+1-6ubuntu1.1_amd64.deb

如你所见，这个包还额外依赖了一些软件包，这意味着，如果主机目前没有这些被依赖的软件包，直接使用dpkg安装可能会存在一些问题，因为dpkg并不能为你解决依赖关系。
# 使用dpkg安装
$ sudo dpkg -i emacs24_24.5+1-6ubuntu1.1_amd64.deb

我们将如何解决这个错误呢？这就要用到apt-get了，使用它的-f参数了，修复依赖关系的安装
$ sudo apt-get update
$ sudo apt-get -f install -y

3.3 查看已安装软件包的安装目录
如果你依然在纠结到底linux将软件安装到了什么地方，那么很幸运你将可以通过dpkg找到答案
使用dpkg -L查看deb包目录信息
$ sudo dpkg -L emacs24
dpkg还有一些其他的参数，这里将作为练习题由你自己来学习

四、从二进制包安装
二进制包的安装比较简单，我们需要做的只是将从网络上下载的二进制包解压后放到合适的目录，
然后将包含可执行的主程序文件的目录添加进PATH环境变量即可，如果你不知道该放到什么位置，
请重新复习第四节关于 Linux 目录结构的内容。

作业
安装：
$ sudo apt-get update
$ sudo apt-get install bb
$ /usr/games/bb

实验 15 Linux 进程概念
1.2实验知识点
进程与程序
进程的衍生
工作管理

二、概念的理解
首先程序与进程是什么？程序与进程又有什么区别？

程序（procedure）：不太精确地说，程序就是执行一系列有逻辑、有顺序结构的指令，帮我们达成某个结果。就如我们去餐馆，给服务员说我要牛肉盖浇饭，她执行了做牛肉盖浇饭这么一个程序，最后我们得到了这么一盘牛肉盖浇饭。它需要去执行，不然它就像一本武功秘籍，放在那里等人翻看。

进程（process）：进程是程序在一个数据集合上的一次执行过程，在早期的UNIX、Linux 2.4及更早的版本中，它是系统进行资源分配和调度的独立基本单位。同上一个例子，就如我们去了餐馆，给服务员说我要牛肉盖浇饭，她执行了做牛肉盖浇饭这么一个程序，而里面做饭的是一个进程，做牛肉汤汁的是一个进程，把牛肉汤汁与饭混合在一起的是一个进程，把饭端上桌的是一个进程。它就像是我们在看武功秘籍这么一个过程，然后一个篇章一个篇章地去练。

简单来说，程序是为了完成某种任务而设计的软件，比如 vim 是程序。什么是进程呢？进程就是运行中的程序。

程序只是一些列指令的集合，是一个静止的实体，而进程不同，进程有以下的特性：

动态性：进程的实质是一次程序执行的过程，有创建、撤销等状态的变化。而程序是一个静态的实体。
并发性：进程可以做到在一个时间段内，有多个程序在运行中。程序只是静态的实体，所以不存在并发性。
独立性：进程可以独立分配资源，独立接受调度，独立地运行。
异步性：进程以不可预知的速度向前推进。
结构性：进程拥有代码段、数据段、PCB（进程控制块，进程存在的唯一标志）。也正是因为有结构性，进程才可以做到独立地运行。
并发：在一个时间段内，宏观来看有多个程序都在活动，有条不紊的执行（每一瞬间只有一个在执行，只是在一段时间有多个程序都执行过）

并行：在每一个瞬间，都有多个程序都在同时执行，这个必须有多个 CPU 才行

引入进程是因为传统意义上的程序已经不足以描述 OS 中各种活动之间的动态性、并发性、独立性还有相互制约性。程序就像一个公司，只是一些证书，文件的堆积（静态实体）。而当公司运作起来就有各个部门的区分，财务部，技术部，销售部等等，就像各个进程，各个部门之间可以独立运做，也可以有交互（独立性、并发性）。

而随着程序的发展越做越大，又会继续细分，从而引入了线程的概念，当代多数操作系统、Linux 2.6及更新的版本中，进程本身不是基本运行单位，而是线程的容器。就像上述所说的，每个部门又会细分为各个工作小组（线程），而工作小组需要的资源需要向上级（进程）申请。

线程（thread）是操作系统能够进行运算调度的最小单位。它被包含在进程之中，是进程中的实际运作单位。一条线程指的是进程中一个单一顺序的控制流，一个进程中可以并发多个线程，每条线程并行执行不同的任务。因为线程中几乎不包含系统资源，所以执行更快、更有效率。

简而言之,一个程序至少有一个进程,一个进程至少有一个线程。线程的划分尺度小于进程，使得多线程程序的并发性高。另外，进程在执行过程中拥有独立的内存单元，而多个线程共享内存，从而极大地提高了程序的运行效率。就如下图所示：
![](https://dn-simplecloud.shiyanlou.com/1135081469062947147-wm)

三、进程的属性
3.1 进程的分类
大概明白进程是个什么样的存在后，我们需要进一步了解的就是进程分类。可以从两个角度来分：

以进程的功能与服务的对象来分；
以应用程序的服务类型来分；
第一个角度来看，我们可以分为用户进程与系统进程：

用户进程：通过执行用户程序、应用程序或称之为内核之外的系统程序而产生的进程，此类进程可以在用户的控制下运行或关闭。
系统进程：通过执行系统内核程序而产生的进程，比如可以执行内存资源分配和进程切换等相对底层的工作；而且该进程的运行不受用户的干预，即使是 root 用户也不能干预系统进程的运行。
第二角度来看，我们可以将进程分为交互进程、批处理进程、守护进程

交互进程：由一个 shell 终端启动的进程，在执行过程中，需要与用户进行交互操作，可以运行于前台，也可以运行在后台。
批处理进程：该进程是一个进程集合，负责按顺序启动其他的进程。
守护进程：守护进程是一直运行的一种进程，在 Linux 系统启动时启动，在系统关闭时终止。它们独立于控制终端并且周期性的执行某种任务或等待处理某些发生的事件。例如 httpd 进程，一直处于运行状态，等待用户的访问。还有经常用的 cron（在 centOS 系列为 crond）进程，这个进程为 crontab 的守护进程，可以周期性的执行用户设定的某些任务。

3.2 进程的衍生
进程有这么多的种类，那么进程之间定是有相关性的，而这些有关联性的进程又是如何产生的，如何衍生的？

就比如我们启动了终端，就是启动了一个 bash 进程，我们可以在 bash 中再输入 bash 则会再启动一个 bash 的进程，此时第二个 bash 进程就是由第一个 bash 进程创建出来的，他们之间又是个什么关系？

我们一般称呼第一个 bash 进程是第二 bash 进程的父进程，第二 bash 进程是第一个 bash 进程的子进程，这层关系是如何得来的呢？

关于父进程与子进程便会提及这两个系统调用 fork() 与 exec()

fork-exec是由 Dennis M. Ritchie 创造的

fork() 是一个系统调用（system call），它的主要作用就是为当前的进程创建一个新的进程，这个新的进程就是它的子进程，这个子进程除了父进程的返回值和 PID 以外其他的都一模一样，如进程的执行代码段，内存信息，文件描述，寄存器状态等等

exec() 也是系统调用，作用是切换子进程中的执行程序也就是替换其从父进程复制过来的代码段与数据段

子进程就是父进程通过系统调用 fork() 而产生的复制品，fork() 就是把父进程的 PCB 等进程的数据结构信息直接复制过来，只是修改了 PID，所以一模一样，只有在执行 exec() 之后才会不同，而早先的 fork() 比较消耗资源后来进化成 vfork(),效率高了不少，感兴趣的同学可以查查为什么。

这就是子进程产生的由来。简单的实现逻辑就如下方所示【注释１】

pid_t p;

p = fork();
if (p == (pid_t) -1)
        /* ERROR */
else if (p == 0)
        /* CHILD */
else
        /* PARENT */
copy
既然子进程是通过父进程而衍生出来的，那么子进程的退出与资源的回收定然与父进程有很大的相关性。当一个子进程要正常的终止运行时，或者该进程结束时它的主函数 main() 会执行 exit(n); 或者 return n，这里的返回值 n 是一个信号，系统会把这个 SIGCHLD 信号传给其父进程，当然若是异常终止也往往是因为这个信号。

在将要结束时的子进程代码执行部分已经结束执行了，系统的资源也基本归还给系统了，但若是其进程的进程控制块（PCB）仍驻留在内存中，而它的 PCB 还在，代表这个进程还存在（因为 PCB 就是进程存在的唯一标志，里面有 PID 等消息），并没有消亡，这样的进程称之为僵尸进程（Zombie）。

如图中第四列标题是 S，S 表示的是进程的状态，而在下属的第三行的 Z 表示的是 Zombie 的意思。（ ps 命令将在后续详解）

实验楼

正常情况下，父进程会收到两个返回值：exit code（SIGCHLD 信号）与 reason for termination 。之后，父进程会使用 wait(&status) 系统调用以获取子进程的退出状态，然后内核就可以从内存中释放已结束的子进程的 PCB；而如若父进程没有这么做的话，子进程的 PCB 就会一直驻留在内存中，一直留在系统中成为僵尸进程（Zombie）。

虽然僵尸进程是已经放弃了几乎所有内存空间，没有任何可执行代码，也不能被调度，在进程列表中保留一个位置，记载该进程的退出状态等信息供其父进程收集，从而释放它。但是 Linux 系统中能使用的 PID 是有限的，如果系统中存在有大量的僵尸进程，系统将会因为没有可用的 PID 从而导致不能产生新的进程。

另外如果父进程结束（非正常的结束），未能及时收回子进程，子进程仍在运行，这样的子进程称之为孤儿进程。在 Linux 系统中，孤儿进程一般会被 init 进程所“收养”，成为 init 的子进程。由 init 来做善后处理，所以它并不至于像僵尸进程那样无人问津，不管不顾，大量存在会有危害。

进程 0 是系统引导时创建的一个特殊进程，也称之为内核初始化，其最后一个动作就是调用 fork() 创建出一个子进程运行 /sbin/init 可执行文件,而该进程就是 PID=1 的进程 1，而进程 0 就转为交换进程（也被称为空闲进程），进程 1 （init 进程）是第一个用户态的进程，再由它不断调用 fork() 来创建系统里其他的进程，所以它是所有进程的父进程或者祖先进程。同时它是一个守护程序，直到计算机关机才会停止。

通过以下的命令我们可以很明显的看到这样的结构

pstree
copy
实验楼

或者从此图我们可以更加形象的看清子父进程的关系

实验楼

通过以上的显示结果我们可以看的很清楚，init 为所有进程的父进程或者说是祖先进程

我们还可以使用这样一个命令来看，其中 pid 就是该进程的一个唯一编号，ppid 就是该进程的父进程的 pid，command 表示的是该进程通过执行什么样的命令或者脚本而产生的

ps －fxo user,ppid,pid,pgid,command
copy
实验楼

可以在图中看见我们执行的 ps 就是由 zsh 通过 fork-exec 创建的子进程而执行的

使用这样的一个命令我们也能清楚的看见 init 如上文所说是由进程 0 这个初始化进程来创建出来的子进程,而其他的进程基本是由 init 创建的子进程，或者是由它的子进程创建出来的子进程。所以 init 是用户进程的第一个进程也是所有用户进程的父进程或者祖先进程。（ps 命令将在后续课程详解）

就像一个树状图，而 init 进程就是这棵树的根，其他进程由根不断的发散，开枝散叶

3.3 进程组与 Sessions
每一个进程都会是一个进程组的成员，而且这个进程组是唯一存在的，他们是依靠 PGID（process group ID）来区别的，而每当一个进程被创建的时候，它便会成为其父进程所在组中的一员。

一般情况，进程组的 PGID 等同于进程组的第一个成员的 PID，并且这样的进程称为该进程组的领导者,也就是领导进程，进程一般通过使用 getpgrp() 系统调用来寻找其所在组的 PGID，领导进程可以先终结，此时进程组依然存在，并持有相同的PGID，直到进程组中最后一个进程终结。

与进程组类似，每当一个进程被创建的时候，它便会成为其父进程所在 Session 中的一员，每一个进程组都会在一个 Session 中，并且这个 Session 是唯一存在的，

Session 主要是针对一个 tty 建立，Session 中的每个进程都称为一个工作(job)。每个会话可以连接一个终端(control terminal)。当控制终端有输入输出时，都传递给该会话的前台进程组。Session 意义在于将多个 jobs 囊括在一个终端，并取其中的一个 job 作为前台，来直接接收该终端的输入输出以及终端信号。 其他 jobs 在后台运行。

前台（foreground）就是在终端中运行，能与你有交互的

后台（background）就是在终端中运行，但是你并不能与其任何的交互，也不会显示其执行的过程

3.4 工作管理
bash(Bourne-Again shell)支持工作控制（job control）,而 sh（Bourne shell）并不支持。

并且每个终端或者说 bash 只能管理当前终端中的 job，不能管理其他终端中的 job。比如我当前存在两个 bash 分别为 bash1、bash2，bash1 只能管理其自己里面的 job 并不能管理 bash2 里面的 job

我们都知道当一个进程在前台运作时我们可以用 ctrl + c 来终止它，但是若是在后台的话就不行了。

我们可以通过 & 这个符号，让我们的命令在后台中运行

ls &
copy
实验楼

图中所显示的 [1] 236分别是该 job 的 job number 与该进程的 PID，而最后一行的 Done 表示该命令已经在后台执行完毕。

我们还可以通过 ctrl + z 使我们的当前工作停止并丢到后台中去

实验楼

被停止并放置在后台的工作我们可以使用这个命令来查看

jobs
copy
实验楼

其中第一列显示的为被放置后台 job 的编号，而第二列的 ＋ 表示最近(刚刚、最后)被放置后台的 job，同时也表示预设的工作，也就是若是有什么针对后台 job 的操作，首先对预设的 job，- 表示倒数第二（也就是在预设之前的一个）被放置后台的工作，倒数第三个（再之前的）以后都不会有这样的符号修饰，第三列表示它们的状态，而最后一列表示该进程执行的命令

我们可以通过这样的一个命令将后台的工作拿到前台来

#后面不加参数提取预设工作，加参数提取指定工作的编号
#ubuntu 在 zsh 中需要 %，在 bash 中不需要 %
fg [%jobnumber]
copy
实验楼

实验楼

之前我们通过 ctrl + z 使得工作停止放置在后台，若是我们想让其在后台运作我们就使用这样一个命令

#与fg类似，加参则指定，不加参则取预设
bg [%jobnumber]
copy
实验楼

既然有方法将被放置在后台的工作提至前台或者让它从停止变成继续运行在后台，当然也有方法删除一个工作，或者重启等等

#kill的使用格式如下
kill -signal %jobnumber

#signal从1-64个信号值可以选择，可以这样查看
kill －l
copy
其中常用的有这些信号值

信号值	作用
-1	重新读取参数运行，类似与restart
-2	如同 ctrl+c 的操作退出
-9	强制终止该任务
-15	正常的方式终止该任务
实验楼

注意

若是在使用kill＋信号值然后直接加 pid，你将会对 pid 对应的进程进行操作

若是在使用kill+信号值然后 ％jobnumber，这时所操作的对象是 job，这个数字就是就当前 bash 中后台的运行的 job 的 ID

实验 16
Linux 进程管理

查看进程的运行状态
进程的结束控制
进程的执行顺序
二、 进程的查看
不管在测试的时候、在实际的生产环境中，还是自己的使用过程中，难免会遇到一些进程异常的情况，所以 Linux 为我们提供了一些工具来查看进程的状态信息。我们可以通过 top 实时的查看进程的状态，以及系统的一些信息（如 CPU、内存信息等），我们还可以通过 ps 来静态查看当前的进程信息，同时我们还可以使用 pstree 来查看当前活跃进程的树形结构。

2.1 top 工具的使用
top 工具是我们常用的一个查看工具，能实时的查看我们系统的一些关键信息的变化:

top
copy
实验楼

top 是一个在前台执行的程序，所以执行后便进入到这样的一个交互界面，正是因为交互界面我们才可以实时的获取到系统与进程的信息。在交互界面中我们可以通过一些指令来操作和筛选。在此之前我们先来了解显示了哪些信息。

我们看到 top 显示的第一排，

内容	解释
top	表示当前程序的名称
11:05:18	表示当前的系统的时间
up 8 days,17:12	表示该机器已经启动了多长时间
1 user	表示当前系统中只有一个用户
load average: 0.29,0.20,0.25	分别对应1、5、15分钟内cpu的平均负载
load average 在 wikipedia 中的解释是 the system load is a measure of the amount of work that a computer system is doing 也就是对当前 CPU 工作量的度量，具体来说也就是指运行队列的平均长度，也就是等待 CPU 的平均进程数相关的一个计算值。

我们该如何看待这个load average 数据呢？

假设我们的系统是单 CPU、单内核的，把它比喻成是一条单向的桥，把CPU任务比作汽车。

load = 0 的时候意味着这个桥上并没有车，cpu 没有任何任务；
load < 1 的时候意味着桥上的车并不多，一切都还是很流畅的，cpu 的任务并不多，资源还很充足；
load = 1 的时候就意味着桥已经被车给占满了，没有一点空隙，cpu 的已经在全力工作了，所有的资源都被用完了，当然还好，这还在能力范围之内，只是有点慢而已；
load > 1 的时候就意味着不仅仅是桥上已经被车占满了，就连桥外都被占满了，cpu 已经在全力工作，系统资源的用完了，但是还是有大量的进程在请求，在等待。若是这个值大于２、大于３，表示进程请求超过 CPU 工作能力的 2 到 ３ 倍。而若是这个值 > 5 说明系统已经在超负荷运作了。
这是单个 CPU 单核的情况，而实际生活中我们需要将得到的这个值除以我们的核数来看。我们可以通过以下的命令来查看 CPU 的个数与核心数

#查看物理CPU的个数
#cat /proc/cpuinfo |grep "physical id"|sort |uniq|wc -l

#每个cpu的核心数
cat /proc/cpuinfo |grep "physical id"|grep "0"|wc -l
copy
通过上面的指数我们可以得知 load 的临界值为 1 ，但是在实际生活中，比较有经验的运维或者系统管理员会将临界值定为0.7。这里的指数都是除以核心数以后的值，不要混淆了

若是 load < 0.7 并不会去关注他；
若是 0.7< load < 1 的时候我们就需要稍微关注一下了，虽然还可以应付但是这个值已经离临界不远了；
若是 load = 1 的时候我们就需要警惕了，因为这个时候已经没有更多的资源的了，已经在全力以赴了；
若是 load > 5 的时候系统已经快不行了，这个时候你需要加班解决问题了
通常我们都会先看 15 分钟的值来看这个大体的趋势，然后再看 5 分钟的值对比来看是否有下降的趋势。

查看 busybox 的代码可以知道，数据是每 5 秒钟就检查一次活跃的进程数，然后计算出该值，然后 load 从 /proc/loadavg 中读取的。而这个 load 的值是如何计算的呢，这是 load 的计算的源码

#define FSHIFT      11          /* nr of bits of precision */
#define FIXED_1     (1<<FSHIFT) /* 1.0 as fixed-point(定点) */
#define LOAD_FREQ   (5*HZ)      /* 5 sec intervals，每隔5秒计算一次平均负载值 */
#define CALC_LOAD(load, exp, n)     \
         load *= exp;               \
         load += n*(FIXED_1 - exp); \
         load >>= FSHIFT;

unsigned long avenrun[3];

EXPORT_SYMBOL(avenrun);

/*
* calc_load - given tick count, update the avenrun load estimates.
* This is called while holding a write_lock on xtime_lock.
*/
static inline void calc_load(unsigned long ticks)
{
        unsigned long active_tasks; /* fixed-point */
        static int count = LOAD_FREQ;
        count -= ticks;
        if (count < 0) {
                count += LOAD_FREQ;
                active_tasks = count_active_tasks();
                CALC_LOAD(avenrun[0], EXP_1, active_tasks);
                CALC_LOAD(avenrun[1], EXP_5, active_tasks);
                CALC_LOAD(avenrun[2], EXP_15, active_tasks);
        }
}
copy
有兴趣的朋友可以研究一下，是如何计算的。代码中的后面这部分相当于它的计算公式

我们回归正题，来看 top 的第二行数据，基本上第二行是进程的一个情况统计

内容	解释
Tasks: 26 total	进程总数
1 running	1个正在运行的进程数
25 sleeping	25个睡眠的进程数
0 stopped	没有停止的进程数
0 zombie	没有僵尸进程数
来看 top 的第三行数据，这一行基本上是 CPU 的一个使用情况的统计了

内容	解释
Cpu(s): 1.0%us	用户空间进程占用CPU百分比
1.0% sy	内核空间运行占用CPU百分比
0.0%ni	用户进程空间内改变过优先级的进程占用CPU百分比
97.9%id	空闲CPU百分比
0.0%wa	等待输入输出的CPU时间百分比
0.1%hi	硬中断(Hardware IRQ)占用CPU的百分比
0.0%si	软中断(Software IRQ)占用CPU的百分比
0.0%st	(Steal time) 是 hypervisor 等虚拟服务中，虚拟 CPU 等待实际 CPU 的时间的百分比
CPU 利用率是对一个时间段内 CPU 使用状况的统计，通过这个指标可以看出在某一个时间段内 CPU 被占用的情况，而 Load Average 是 CPU 的 Load，它所包含的信息不是 CPU 的使用率状况，而是在一段时间内 CPU 正在处理以及等待 CPU 处理的进程数情况统计信息，这两个指标并不一样。

来看 top 的第四行数据，这一行基本上是内存的一个使用情况的统计了：

内容	解释
8176740 total	物理内存总量
8032104 used	使用的物理内存总量
144636 free	空闲内存总量
313088 buffers	用作内核缓存的内存量
注意

系统中可用的物理内存最大值并不是 free 这个单一的值，而是 free + buffers + swap 中的 cached 的和

来看 top 的第五行数据，这一行基本上是交换区的一个使用情况的统计了

内容	解释
total	交换区总量
used	使用的交换区总量
free	空闲交换区总量
cached	缓冲的交换区总量,内存中的内容被换出到交换区，而后又被换入到内存，但使用过的交换区尚未被覆盖
再下面就是进程的一个情况了

列名	解释
PID	进程id
USER	该进程的所属用户
PR	该进程执行的优先级 priority 值
NI	该进程的 nice 值
VIRT	该进程任务所使用的虚拟内存的总数
RES	该进程所使用的物理内存数，也称之为驻留内存数
SHR	该进程共享内存的大小
S	该进程进程的状态: S=sleep R=running Z=zombie
%CPU	该进程CPU的利用率
%MEM	该进程内存的利用率
TIME+	该进程活跃的总时间
COMMAND	该进程运行的名字
注意

NICE 值叫做静态优先级，是用户空间的一个优先级值，其取值范围是-20至19。这个值越小，表示进程”优先级”越高，而值越大“优先级”越低。nice值中的 -20 到 19，中 -20 优先级最高， 0 是默认的值，而 19 优先级最低

PR 值表示 Priority 值叫动态优先级，是进程在内核中实际的优先级值，进程优先级的取值范围是通过一个宏定义的，这个宏的名称是 MAX_PRIO，它的值为 140。Linux 实际上实现了 140 个优先级范围，取值范围是从 0-139，这个值越小，优先级越高。而这其中的 0 - 99 是实时进程的值，而 100 - 139 是给用户的。

其中 PR 中的 100 to 139 值部分有这么一个对应 PR = 20 + (-20 to +19)，这里的 -20 to +19 便是nice值，所以说两个虽然都是优先级，而且有千丝万缕的关系，但是他们的值，他们的作用范围并不相同

** VIRT **任务所使用的虚拟内存的总数，其中包含所有的代码，数据，共享库和被换出 swap空间的页面等所占据空间的总数

在上文我们曾经说过 top 是一个前台程序，所以是一个可以交互的

常用交互命令	解释
q	退出程序
I	切换显示平均负载和启动时间的信息
P	根据CPU使用百分比大小进行排序
M	根据驻留内存大小进行排序
i	忽略闲置和僵死的进程，这是一个开关式命令
k	终止一个进程，系统提示输入 PID 及发送的信号值。一般终止进程用 15 信号，不能正常结束则使用 9 信号。安全模式下该命令被屏蔽。
好好的利用 top 能够很有效的帮助我们观察到系统的瓶颈所在，或者是系统的问题所在。

2.2 ps 工具的使用
ps 也是我们最常用的查看进程的工具之一，我们通过这样的一个命令来了解一下，他能给我带来哪些信息

ps aux
ps axjf

我们来总体了解下会出现哪些信息给我们，这些信息又代表着什么（更多的 keywords 大家可以通过 man ps 了解）

内容	解释
F	进程的标志（process flags），当 flags 值为 1 则表示此子程序只是 fork 但没有执行 exec，为 4 表示此程序使用超级管理员 root 权限
USER	进程的拥有用户
PID	进程的 ID
PPID	其父进程的 PID
SID	session 的 ID
TPGID	前台进程组的 ID
%CPU	进程占用的 CPU 百分比
%MEM	占用内存的百分比
NI	进程的 NICE 值
VSZ	进程使用虚拟内存大小
RSS	驻留内存中页的大小
TTY	终端 ID
S or STAT	进程状态
WCHAN	正在等待的进程资源
START	启动进程的时间
TIME	进程消耗CPU的时间
COMMAND	命令的名称和参数
TPGID栏写着-1的都是没有控制终端的进程，也就是守护进程

STAT表示进程的状态，而进程的状态有很多，如下表所示

状态	解释
R	Running.运行中
S	Interruptible Sleep.等待调用
D	Uninterruptible Sleep.不可中断睡眠
T	Stoped.暂停或者跟踪状态
X	Dead.即将被撤销
Z	Zombie.僵尸进程
W	Paging.内存交换
N	优先级低的进程
<	优先级高的进程
s	进程的领导者
L	锁定状态
l	多线程状态
+	前台进程
其中的 D 是不能被中断睡眠的状态，处在这种状态的进程不接受外来的任何 signal，所以无法使用 kill 命令杀掉处于D状态的进程，无论是 kill，kill -9 还是 kill -15，一般处于这种状态可能是进程 I/O 的时候出问题了。

ps 工具有许多的参数，下面给大家解释部分常用的参数

使用 -l 参数可以显示自己这次登录的 bash 相关的进程信息罗列出来

ps -l

相对来说我们更加常用下面这个命令，他将会罗列出所有的进程信息

ps aux

若是查找其中的某个进程的话，我们还可以配合着 grep 和正则表达式一起使用

ps aux | grep zsh

此外我们还可以查看时，将连同部分的进程呈树状显示出来

ps axjf

当然如果你觉得使用这样的此时没有把你想要的信息放在一起，我们也可以是用这样的命令，来自定义我们所需要的参数显示

ps -afxo user,ppid,pid,pgid,command

这是一个简单而又实用的工具，想要更灵活的使用，想要知道更多的参数我们可以使用 man 来获取更多相关的信息
2.3 pstree 工具的使用
pstree 可以很直接的看到相同的进程数量，最主要的还是我们可以看到所有进程之间的相关性。

pstree

'''
pstree -up

#参数选择：
#-A  ：各程序树之间以 ASCII 字元來連接；
#-p  ：同时列出每个 process 的 PID；
#-u  ：同时列出每个 process 的所屬账户名称。
'''
三、进程的管理

3.1 kill 命令的掌握
上个实验中我们讲诉了进程之间是如何衍生，之间又有什么相关性，我们来回顾一下，当一个进程结束的时候或者要异常结束的时候，会向其父进程返回一个或者接收一个 SIGHUP 信号而做出的结束进程或者其他的操作，这个 SIGHUP 信号不仅可以由系统发送，我们可以使用 kill 来发送这个信号来操作进程的结束或者重启等等。

上节课程我们使用 kill 命令来管理我们的一些 job，这节课我们将尝试用 kill 来操作下一些不属于 job 范畴的进程，直接对 pid 下手


'''#首先我们使用图形界面打开了 gedit、gvim，用 ps 可以查看到
ps aux

#使用9这个信号强制结束 gedit 进程
kill -9 1608

#我们再查找这个进程的时候就找不到了'''

3.2 进程的执行顺序
我们在使用 ps 命令的时候可以看到大部分的进程都是处于休眠的状态，如果这些进程都被唤醒，那么该谁最先享受 CPU 的服务，后面的进程又该是一个什么样的顺序呢？进程调度的队列又该如何去排列呢？

当然就是靠该进程的优先级值来判定进程调度的优先级，而优先级的值就是上文所提到的 PR 与 nice 来控制与体现了

而 nice 的值我们是可以通过 nice 命令来修改的，而需要注意的是 nice 值可以调整的范围是 -20 ~ 19，其中 root 有着至高无上的权力，既可以调整自己的进程也可以调整其他用户的程序，并且是所有的值都可以用，而普通用户只可以调制属于自己的进程，并且其使用的范围只能是 0 ~ 19，因为系统为了避免一般用户抢占系统资源而设置的一个限制

#这个实验在环境中无法做，因为权限不够，可以自己在本地尝试

#打开一个程序放在后台，或者用图形界面打开
'''nice -n -5 vim &'''

#用 ps 查看其优先级
ps -afxo user,ppid,pid,stat,pri,ni,time,command | grep vim
copy
我们还可以用 renice 来修改已经存在的进程的优先级，同样因为权限的原因在实验环境中无法尝试

renice -5 pid


ps aux | grep gedit 

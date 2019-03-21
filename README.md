# VIM Linux开发环境搭建

## 基础环境
```Bash
#for centos
[root@localhost ~]# yum -y install gcc gcc-c++ cmake git
[root@localhost ~]# yum -y install ncurses-devel python-devel
```
```Bash
#for mac os
[root@localhost ~]# ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
[root@localhost ~]# brew cask install git
[root@localhost ~]# brew cask install cmake
```

## 源码安装VIM
### 下载源码
```Bash
[root@localhost ~]# wget https://github.com/vim/vim/archive/master.zip 或
[root@localhost ~]# git clone https://github.com/vim/vim.git
```

### 编译安装
```Bash
[root@localhost ~]# ./configure --prefix=/usr --with-features=huge --enable-fontset --disable-selinux  --enable-cscope --enable-multibyte --enable-pythoninterp --with-python-config-dir=/usr/lib64/python2.7/config/
[root@localhost ~]# make && make install
```

参数说明：<br>
>--with-features=huge    支持最大特性 <br>
>--enable-pythoninterp   打开对python编写的插件的支持 <br>
>--enable-python3interp  打开对python3编写的插件的支持 <br>
>--enable-multibyte      打开多字节支持，可以在Vim中输入中文 <br>
>--enable-cscope         打开对cscope的支持 <br>
>--with-python-config-dir=/usr/lib64/python2.7/config 指定python 路径 <br>
>--with-python-config-dir=/usr/lib64/python3.5/config 指定python3路径 <br>

## 相关插件及配置
### ack全局搜索插件
* 安装ag命令行工具
```Bash
[root@localhost ~]# brew install the_silver_searcher    # for mac os
[root@localhost ~]# yum install silversearcher-ag       # for ubuntu os
[root@localhost ~]# yum install the_silver_searcher     # for centos
```

### tagbar代码结构插件
* MacOS需要下载ctags-exuberant
```Bash
[~]$ brew install ctags-exuberant
```

### vim-go代码补全插件
* 编译安装goimports, golint
```Bash
[~/project]$ mkdir -p src/golang.org/x && cd src/golang.org/x
[~/project]$ git clone https://github.com/golang/tools.git
[~/project]$ git clone https://github.com/golang/lint.git

[~/project/src/golang.org/x]$ cd tools/cmd/goimports/ && go install
[~/project/src/golang.org/x/tools/cmd/goimports]$ cd ~/project/src/golang.org/x/lint/golint/ && go install

[~/project/src/golang.org/x/tools/cmd/goimports]$ mv ~/project/bin/goimports /usr/local/go/bin/
[~/project/src/golang.org/x/tools/cmd/goimports]$ mv ~/project/bin/golint /usr/local/go/bin/

[~/project]$ go get github.com/kisielk/errcheck
[~/project]$ go install github.com/kisielk/errcheck
[~/project]$ sudo mv ~/project/bin/errcheck  /usr/local/go/bin/
```



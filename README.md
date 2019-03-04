一、基础环境
    yum -y install gcc gcc-c++ cmake git
    yum -y install ncurses-devel python-devel

三、源码安装VIM
    3.1、下载源码:
        wget https://github.com/vim/vim/archive/master.zip 或
        git clone https://github.com/vim/vim.git

    3.2、编译安装
        ./configure --prefix=/usr --with-features=huge --enable-fontset --disable-selinux  --enable-cscope --enable-multibyte --enable-pythoninterp --with-python-config-dir=/usr/lib64/python2.7/config/
        make && make install

        参数说明：
        --with-features=huge    支持最大特性
        --enable-pythoninterp   打开对python编写的插件的支持
        --enable-python3interp  打开对python3编写的插件的支持
        --enable-multibyte      打开多字节支持，可以在Vim中输入中文
        --enable-cscope         打开对cscope的支持
        --with-python-config-dir=/usr/lib64/python2.7/config 指定python 路径
        --with-python-config-dir=/usr/lib64/python3.5/config 指定python3路径

四、相关插件
    4.1、支持全局搜索ACK
        curl https://beyondgrep.com/ack-2.22-single-file > /usr/bin/ack && chmod 0755 /usr/bin/ack


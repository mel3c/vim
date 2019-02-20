python基础环境  2.7.9

一、安装基础环境
    yum install git
    yum install gcc
    yum install ctags
    yum install gcc-c++
    yum install python2.7-dev   //centos7 可不装
    yum install python-devel
    yum install ncurses-devel

二、安装Cmake编译工具
    https://cmake.org/files/v3.8/
    ./bootstrap --prefix=/usr/local/cmake
    make && make install
    或者(尽量选择源码安装，ycm安装的cmake版本过低容易报错)
    yum install cmake

三、源码安装vim编辑器
    下载vim源码：git clone https://github.com/vim/vim.git
    ./configure --prefix=/usr --with-features=huge  --enable-luainterp=yes --enable-rubyinterp=yes --enable-fontset --enable-sniff --enable-xim --disable-selinux  --enable-cscope --enable-multibyte --enable-pythoninterp --with-python-config-dir=/usr/lib64/python2.7/config/

    编译参数说明：
    –with-features=huge：支持最大特性
    –enable-rubyinterp：打开对ruby编写的插件的支持
    –enable-pythoninterp：打开对python编写的插件的支持
    –enable-python3interp：打开对python3编写的插件的支持
    –enable-luainterp：打开对lua编写的插件的支持
    –enable-perlinterp：打开对perl编写的插件的支持
    –enable-multibyte：打开多字节支持，可以在Vim中输入中文
    –enable-cscope：打开对cscope的支持
    –with-python-config-dir=/usr/lib64/python2.7/config 指定python 路径
    –with-python-config-dir=/usr/lib64/python3.5/config 指定python3路径
    make && make install

四、安装插件管理器
    git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

    管理器常用命令：
    :BundleList -列举出列表中(.vimrc中)配置的所有插件
    :BundleInstall -安装列表中全部插件
    :BundleInstall! -更新列表中全部插件
    :BundleSearch foo -查找foo插件

    :BundleSearch! foo -刷新foo插件缓存
    :BundleClean -清除列表中没有的插件
    :BundleClean! -清除列表中没有的插件

五、安装YouCompleteMe + llvm + clang
        说明：在上一步中安装YouCompleteMe插件较慢，可以选择git安装
        git clone --recursive https://github.com/Valloric/YouCompleteMe.git
        git submodule update --init --recursive      //确认仓库的完整性

        5.1、安装llvm + clang
            //下载所需要的源码包
            cd /root
            wget -c http://releases.llvm.org/4.0.1/llvm-4.0.1.src.tar.xz
            wget -c http://releases.llvm.org/4.0.1/clang-tools-extra-4.0.1.src.tar.xz
            wget -c http://releases.llvm.org/4.0.1/cfe-4.0.1.src.tar.xz
            wget -c http://releases.llvm.org/4.0.1/compiler-rt-4.0.1.src.tar.xz
            wget -c http://releases.llvm.org/4.0.1/libcxx-4.0.1.src.tar.xz
            wget -c http://releases.llvm.org/4.0.1/libcxxabi-4.0.1.src.tar.xz
            wget -c http://releases.llvm.org/4.0.1/libunwind-4.0.1.src.tar.xz

            //解压llvm-4.0.1.src.tar.xz
            tar -xf llvm-4.0.1.src.tar.xz && mv -f llvm-4.0.1.src llvm && rm -rf llvm-4.0.1.src.tar.xz

            //解压cfe-4.0.1.src.tar.xz
            cd llvm/tools/ && mv ~/cfe-4.0.1.src.tar.xz .
            tar -xf cfe-4.0.1.src.tar.xz && mv -f cfe-4.0.1.src clang && rm -rf cfe-4.0.1.src.tar.xz

            //解压clang-tools-extra-4.0.1.src.tar.xz
            cd clang/tools/ && mv ~/clang-tools-extra-4.0.1.src.tar.xz .
            tar -xf clang-tools-extra-4.0.1.src.tar.xz && mv -f clang-tools-extra-4.0.1.src extra && rm -rf clang-tools-extra-4.0.1.src.tar.xz

            进入projescts目录
            cd ../../../projects/ && pwd
            /root/llvm/projects

            //解压compiler-rt-4.0.1.src.tar.xz
            mv ~/compiler-rt-4.0.1.src.tar.xz .
            tar -xf compiler-rt-4.0.1.src.tar.xz && mv -f compiler-rt-4.0.1.src compiler-rt && rm -rf compiler-rt-4.0.1.src.tar.xz

            //解压libcxx-4.0.1.src.tar.xz
            mv ~/libcxx-4.0.1.src.tar.xz .
            tar -xf libcxx-4.0.1.src.tar.xz && mv -f libcxx-4.0.1.src libcxx && rm -rf libcxx-4.0.1.src.tar.xz

            //解压libcxxabi-4.0.1.src.tar.xz
            mv ~/libcxxabi-4.0.1.src.tar.xz .
            tar -xf libcxxabi-4.0.1.src.tar.xz && mv -f libcxxabi-4.0.1.src libcxxabi && rm -rf libcxxabi-4.0.1.src.tar.xz

            //解压libunwind-4.0.1.src.tar.xz
            mv ~/libunwind-4.0.1.src.tar.xz .
            tar -xf libunwind-4.0.1.src.tar.xz && mv -f libunwind-4.0.1.src libunwind && rm -rf libunwind-4.0.1.src.tar.xz

            //创建编译目录，保证源码纯净
            cd ~/ && mkdir build && cd build/

            //创建makefile文件
            cmake -G "Unix Makefiles" -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ -DCLANG_DEFAULT_CXX_STDLIB=libc++ -DCMAKE_BUILD_TYPE="Release" ../llvm

            //编译源码(注意：所安装设备保证CPU为两核，内存为4G，否则容易报错)
            make -j4

            //安装并验证结果
            make install                             //安装主程序
            make install-cxx install-cxxabi    //安装clang/clang++所需要的libc++库
            clang --version                        //检查是否安装成功
            clang++ --version
            which clang
            which clang++
            llvm-config --bindir --includedir --libdir --cmakedir  //查看llvm的配置信息

        5.2、编译安装YouCompleteMe核心文件ycm_core.so
            mkdir /root/ycm_build && cd /root/ycm_build
            cmake -G "Unix Makefiles" -DPATH_TO_LLVM_ROOT=/root/build/ ~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp
            make ycm_core
            注意：DPATH_TO_LLVM_ROOT 为llvm编译后的二进制文件目录


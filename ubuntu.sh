#!/usr/bin/bash


#删除不常用软件
apt-get remove libreoffice-common unity-webapps-common gnome-orca webbrowser-app gnome-sudoku landscape-client-ui-install rhythmbox
apt-get remove empathy brasero simple-scan gnome-mahjongg aisleriot gnome-mines cheese thunderbird totem transmission-common

#添加仓库
add-apt-repository ppa:webupd8team/sublime-text-3
add-apt-repository ppa:diesch/testing
apt-get update

#安装vim unrar sublime 菜单导航工具
apt-get install classicmenu-indicator sublime-text vim unrar

#安装chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
dpkg -i google-chrome-stable_current_amd64.deb

#安装WPS
wget http://kdl.cc.ksosoft.com/wps-community/download/a21/wps-office_10.1.0.5672~a21_amd64.deb
dpkg -i wps-office_10.1.0.5672~a21_amd64.deb

#修改默认python版本
rm /usr/bin/python
ln -s /usr/bin/python3 /usr/bin/python

#安装pycharm
snap install pycharm-community --classic

#安装搜狗输入法
#echo "deb http://archive.ubuntukylin.com:10006/ubuntukylin trusty main" >> /etc/apt/sources.list
#apt-get install sogoupinyin

#安装配置java10
wget http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.tar.gz
tar -xzvf jdk-10.0.1_linux-x64_bin.tar.gz -C /usr
(
cat << EOF
export JAVA_HOME=/usr/jdk-10.0.1
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar
EOF
) >> /etc/profile
source /etc/profile

#安装eclipse 目录为/usr/jee-oxygen
wget http://mirrors.ustc.edu.cn/eclipse/oomph/epp/oxygen/R2/eclipse-inst-linux64.tar.gz
tar -zxvf eclipse-inst-linux64.tar.gz -C /usr
cd /usr/eclipse-installer
./eclipse-inst

#桌面图标
(
cat << EOF
[Desktop Entry]
Encoding=UTF-8
Name=Eclipse
Exec=/usr/jee-oxygen/eclipse/eclipse
Icon=/usr/jee-oxygen/eclipse/icon.xpm
Terminal=false
Type=Application
EOF
) > /usr/share/applications/eclipse.desktop



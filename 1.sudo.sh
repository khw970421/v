set -e  # 오류 발생시 스크립트 종료

#sudo -e /etc/apt/apt.conf.d/10periodic # APT::Periodic::Unattended-Upgrade "0";
#apt-get remove unattended-upgrades
nano /etc/apt/sources.list
crontab -e    # # 1 * * * * rdate -s time.bora.net
nano /etc/ld.so.conf    # MeCab 때문에 설정했으나 python이 꼬임
nano /home/cloudera/.bashrc # 아래줄에 PATH=$PATH:/home/cloudera/.local/bin/ 추가

apt-get -y update
apt-get -y upgrade --fix-missing
apt-get -y install net-tools openssh-server dos2unix rdate
apt --fix-broken install

#rm /etc/localtime
ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime
rdate -s time.bora.net

#nano /etc/crontab
service ssh start
service cron restart
/sbin/ldconfig

apt --fix-broken install
apt-get -y --fix-missing install python-setuptools python3-setuptools python-dev python3-dev
apt-get -y install tcl tcl-dev tk tk-dev python-tk python3-tk python-opencv python-pmw
apt-get -y install graphviz subversion idle git cython pkg-config
apt-get -y install libatlas-base-dev libc6-dev libfreetype6-dev libgirepository1.0-dev libpng-dev
apt-get -y install libportmidi-dev libreadline6-dev libreadline-gplv2-dev libsmpeg-dev libxslt-dev 
apt-get -y install libncursesw5-dev libssl-dev libsqlite3-dev libgdbm-dev libbz2-dev
apt-get -y install libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev
apt-get -y install gfortran default-jdk g++ build-essential checkinstall
apt-get -y install --fix-missing cmake zlib1g libjpeg-dev xvfb xorg-dev python-opengl libboost-all-dev swig  # for gym
apt-get -y --fix-missing install openjdk-11-jdk # openjdk-8-jdk 에서 수정
apt-get -y install curl fceux p7zip-full

#google-chrome
apt --fix-broken install
apt-get -y install libxss1 # libgconf2-4 없어짐

apt -y autoremove

add-apt-repository -y ppa:graphics-drivers/ppa
apt-get update
reboot

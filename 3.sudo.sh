cd /home/cloudera/Downloads/
./cuda_10.0.*.run --override      # 설치중 EULA는 ctrl+c로 넘김. 아래는 설정방법

#Do you accept the previously read EULA?
#accept/decline/quit: accept

#Install NVIDIA Accelerated Graphics Driver for Linux-x86_64 XXX?
#(y)es/(n)o/(q)uit: n

#Install the CUDA 10.0 Toolkit?
#(y)es/(n)o/(q)uit: y

#Enter Toolkit Location
# [ default is /usr/local/cuda-10.0 ]:

#Do you want to install a symbolic link at /usr/local/cuda?
#(y)es/(n)o/(q)uit: y

#Install the CUDA 10.0 Samples?
#(y)es/(n)o/(q)uit: n

#Installing the CUDA Toolkit in /usr/local/cuda-10.0 ...


tar -zxvf cudnn-10.0*.*
cp -P cuda/lib64/libcudnn* /usr/local/cuda-10.0/lib64/ 
cp  cuda/include/cudnn.h /usr/local/cuda-10.0/include/
chmod a+r /usr/local/cuda-10.0/include/cudnn.h /usr/local/cuda/lib64/libcudnn*    # (10.0 일 때)

apt-get -y install libcupti-dev
apt-get -y install dkms nvidia-modprobe
apt-get -y install nvidia-cuda-toolkit



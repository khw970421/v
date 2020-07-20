set -e  # 오류 발생시 스크립트 종료
# https://seongkyun.github.io/others/2019/03/05/hdd_mnt/

############ HDD 확인
sudo fdisk -l

############# HDD 용량이 2TB 이상인 경우
sudo parted /dev/sda  
  #(parted) 에서 mklabel 입력후 New disk label type에는 gpt : 기존 파티션들 지우려고
  # 사용중이라는 warning 이 뜨면 Ignore
  # 데이터가 모두 지워질거라는 warning 뜨면 yes
  # 사용중인데, 재부팅 해야 할거라면 Ignore
  #(parted) 에서 unit GB 입력하여 단위 변환
  #(parted) 에서 print 입력하여 용량 확인 (여기서 4001GB라고 떴다면 아래에 4001GB라고 씀)
  #(parted) 에서 mkpart primary 0GB 4001GB
  #(parted) 에서 q 입력하고 끝냄

sudo fdisk -l   # 여기서 보면 /dev/sda인 Disk 내에 Device가 /dev/sda1 이 있음이 보임
sudo mkfs.ext4 /dev/sda1  # 중간에 accounting information 쓰라는데는 무시하고 넘어감
sudo blkid  # UUID 확인 후 복사   (ex) UUID="6b879c3e-c79e-4368-8d58-98bb6d15b64b"

################ 마운트
sudo mkdir /dev/hdd_ext/        # /dev/sda1 폴더가 있긴 한데, 건들지 말것
sudo mkdir /dev/hdd_ext/sda1
sudo nano /etc/fstab   # 맨 뒤에 다음줄 추가 => UUID=6b879c3e-c79e-4368-8d58-98bb6d15b64b /dev/hdd_ext/sda1 ext4 defaults 0 0
sudo mount -a
df -h           # /dev/hdd_ext/sda1 가 /dev/sda1 에 마운트 됨을 확인
sudo ln -s /dev/hdd_ext/sda1 /home/cloudera/hdd_ext     # cloudera 계정일 때
cd ~/hdd_ext   # ls 하면 sda1이 보이는지 확인. 보이도록 심볼릭 링크 수정
sudo chmod 777 sda1



############# HDD 용량이 2TB 이하인 경우
검색 요망
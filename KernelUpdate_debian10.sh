#!/bin/sh

echo 正在升级内核. . .

echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list.d/backports.list

apt-get update -y

apt-get upgrade -y

apt-get dist-upgrade -y

echo "正在优化大文件读写性能. . ."

curl https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/limits.conf > /etc/security/limits.conf

echo "正在开启Google BBR. . ."

curl https://cdn.jsdelivr.net/gh/HXHGTS/TCPOptimization/sysctl.conf > /etc/sysctl.conf

sysctl -p

echo "正在升级系统软件. . ."

apt install -y build-essential

apt -t bullseye-backports install linux-image-cloud-amd64 -y

apt -t bullseye-backports install linux-headers-cloud-amd64 -y

update-grub

echo 脚本执行完成,正在重启服务器. . .

reboot



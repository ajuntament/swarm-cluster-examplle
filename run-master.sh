apt install -y git
curl https://get.docker.com | sudo bash

## Miscelanea
echo 'colorscheme desert' >> /etc/vim/vimrc

mkdir -p /opt/docker
mkdir -p /srv/nfs

#	Configurar NFS
echo 'maquina-01:/srv/nfs /opt/docker nfs defaults,nfsvers=3 0 0' >> /etc/fstab
apt install -y nfs-kernel-server
systemctl enable nfs-kernel-server
systemctl start nfs-kernel-server
echo '/srv/nfs maquina-01(rw,no_root_squash,no_subtree_check) maquina-02(rw,no_root_squash,no_subtree_check) maquina-03(rw,no_root_squash,no_subtree_check)' >> /etc/exports
systemctl restart nfs-kernel-server
#####echo '/srv/nfs 10.132.0.0/24(rw,no_root_squash,no_subtree_check)' >> /etc/exports
exportfs -r
mount -a

docker swarm init 
docker swarm join-token manager|grep join  > /opt/docker/join.sh
chmod +x /opt/docker/join.sh

docker network create proxy -d overlay
docker network create portainer_agent -d overlay



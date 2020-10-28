apt install -y git
curl https://get.docker.com | sudo bash

## Miscelanea
echo 'colorscheme desert' >> /etc/vim/vimrc

mkdir -p /opt/docker

#	Configurar NFS
echo 'maquina-01:/srv/nfs /opt/docker nfs defaults,nfsvers=3 0 0' >> /etc/fstab
apt install -y nfs-common

mount -a

/opt/docker/join.sh



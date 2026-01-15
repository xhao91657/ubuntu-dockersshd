FROM nvidia/cuda:13.1.0-base-ubuntu24.04
RUN echo "root:12345678" | chpasswd
RUN apt-get update && apt-get install -y openssh-server && \
mkdir -p /var/run/sshd && \
echo 'root:12345678' | chpasswd && \
sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
sed -i 's/^#\?PasswordAuthentication.*/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
sed -i 's/^#\?PermitEmptyPasswords.*/PermitEmptyPasswords no/' /etc/ssh/sshd_config && \
ssh-keygen -A -q -N '' && \
/usr/sbin/sshd -D -e

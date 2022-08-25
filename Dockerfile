# syntax=docker/dockerfile:1.3-labs

FROM ubuntu:22.04

WORKDIR /tmp

# The latest release can be downloaded at https://github.com/GitCredentialManager/git-credential-manager/releases
ADD https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.785/gcm-linux_amd64.2.0.785.deb .

RUN <<EOF
apt-get update
apt-get -y install git libicu-dev
dpkg -i gcm-linux_amd64.2.0.785.deb
EOF

RUN <<EOF
useradd -g users -m mona
EOF

USER mona
WORKDIR /home/mona

RUN <<EOF
# https://github.com/GitCredentialManager/git-credential-manager#linux
git-credential-manager-core configure

git config --global credential.credentialStore plaintext
EOF

ENTRYPOINT ["bash"]

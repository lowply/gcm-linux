# syntax=docker/dockerfile:1.3-labs

FROM ubuntu:22.04

WORKDIR /tmp

RUN <<EOF
useradd -g users -m mona
EOF

RUN <<EOF
apt update
apt -y install git curl gpg libicu-dev
EOF

RUN <<EOF
# The latest release can be downloaded at https://github.com/GitCredentialManager/git-credential-manager/releases
curl -OL https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.696/gcmcore-linux_amd64.2.0.696.deb
dpkg -i gcmcore-linux_amd64.2.0.696.deb
EOF

USER mona
WORKDIR /home/mona

RUN <<EOF
# https://github.com/GitCredentialManager/git-credential-manager#linux
git-credential-manager-core configure

git config --global credential.credentialStore plaintext
EOF

ENTRYPOINT ["bash"]

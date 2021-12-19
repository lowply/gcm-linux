# syntax=docker/dockerfile:1.3-labs

FROM debian:bullseye-slim

RUN <<EOF
apt update
apt -y install git curl gpg
EOF

RUN <<EOF
# https://docs.microsoft.com/en-us/dotnet/core/install/linux-debian#debian-11-
curl -OL https://packages.microsoft.com/config/debian/11/packages-microsoft-prod.deb
dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

apt-get update
apt-get install -y apt-transport-https
apt-get update
apt-get install -y aspnetcore-runtime-6.0
EOF

# https://aka.ms/gcmcore-linuxcredstores
RUN <<EOF
curl -OL https://github.com/GitCredentialManager/git-credential-manager/releases/download/v2.0.605/gcmcore-linux_amd64.2.0.605.12951.deb
dpkg -i gcmcore-linux_amd64.2.0.605.12951.deb

# Fix wrong symlink
ln -sf /usr/local/share/gcm-core/Release/git-credential-manager-core /usr/local/bin/git-credential-manager-core
EOF

RUN <<EOF
# https://github.com/GitCredentialManager/git-credential-manager#linux
git-credential-manager-core configure

# To workaround the `fatal: helper error (139): Unknown` error.
# See https://github.com/GitCredentialManager/git-credential-manager/issues/371
git config --global credential.gitHubHelper ""

git config --global credential.credentialStore plaintext
EOF

ENTRYPOINT ["bash"]

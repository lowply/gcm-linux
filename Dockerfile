FROM debian:buster-slim
MAINTAINER Sho Mizutani <lowply@gmail.com>
WORKDIR /home

RUN apt-get update && apt-get -y install git curl gpg

# https://docs.microsoft.com/en-us/dotnet/core/install/linux-debian#debian-10-
ADD https://packages.microsoft.com/config/debian/10/packages-microsoft-prod.deb /tmp
RUN dpkg -i /tmp/packages-microsoft-prod.deb
RUN apt-get install -y apt-transport-https && apt-get update && apt-get install -y dotnet-runtime-3.1

# https://aka.ms/gcmcore-linuxcredstores
ADD https://github.com/microsoft/Git-Credential-Manager-Core/releases/download/v2.0.249-beta/gcmcore-linux_amd64.2.0.249.58501.deb /tmp
RUN dpkg -i /tmp/gcmcore-linux_amd64.2.0.249.58501.deb

RUN git config --global credential.helper manager-core
RUN git config --global credential.credentialStore plaintext

ENTRYPOINT ["bash"]

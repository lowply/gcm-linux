# gcm-linux

This is an example of how to get started with [Git Credential Manager Core](https://github.com/microsoft/Git-Credential-Manager-Core) on Linux.

## Try it out in one minute

```
docker pull lowply/gcm-linux
docker run -it --rm lowply/gcm-linux
```

Now run `git clone` your private repository in the container. You'll be asked to open a browser and enter the code:

```
root@bc9ae762dac9:/home# git clone https://github.com/owner/repo.git
Cloning into 'repo'...
To complete authentication please visit https://github.com/login/device and enter the following code:
XXXX-XXXX
```

## Credential store

Because this is just an exmaple, `plaintext` is set as the credential store. _Do not do the same on your production environment_. More info at https://aka.ms/gcmcore-linuxcredstores.

## Build

```
docker build . -t lowply/gcm-linux
```

## GitHub App

You can find the Git Credential Manager App at https://github.com/settings/applications

# gcm-linux

This is an example of how to authenticate to GitHub.com using [Git Credential Manager Core](https://github.com/microsoft/Git-Credential-Manager-Core) on Linux.

## Try it out in one minute

```bash
docker pull lowply/gcm-linux
docker run -it --rm lowply/gcm-linux
```

Now try `git clone` your private repository in the container. You'll be asked to authenticate based on the [auth mode](https://github.com/microsoft/Git-Credential-Manager-Core/blob/master/docs/configuration.md#credentialgithubauthmodes) you choose.

### oauth

If the mode is `oauth`, you'll be asked to open a browser and enter the code:

```bash
root@bc9ae762dac9:/home# git clone https://github.com/owner/repo.git
Cloning into 'repo'...
To complete authentication please visit https://github.com/login/device and enter the following code:
XXXX-XXXX
```

You'll find the Git Credential Manager oauth app at https://github.com/settings/applications

### basic

If the mode is `basic`, you'll be asked to enter your username and password, then the 2FA code:

```bash
root@1944a87f7526:/home# git clone https://github.com/owner/repo.git
Cloning into 'repo'...
Enter GitHub credentials for 'https://github.com/'...
Username: owner
Password: *****************

Two-factor authentication is enabled and an authentication code is required.
Use your registered authentication app to generate an authentication code.
Authentication code: XXXXXX
```

You'll find a new PAT is added at https://github.com/settings/tokens

## Credential store

Because this is just an exmaple of how to get started, `plaintext` is set as the credential store because it's the easiest option. _Do not do the same on your production environment_. Please read https://aka.ms/gcmcore-linuxcredstores first.

## Build

```bash
docker build . -t lowply/gcm-linux
```

## Further reading

[Git Credential Manager Core: Building a universal authentication experience - The GitHub Blog](https://github.blog/2020-07-02-git-credential-manager-core-building-a-universal-authentication-experience/)

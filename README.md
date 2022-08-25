# gcm-linux

This is an example of how to authenticate to GitHub.com using [Git Credential Manager](https://github.com/GitCredentialManager/git-credential-manager) on Linux.

## Try it out in one minute

At this moment, you'll first need to authenticate to read publicly available packages. See [Authenticating to the Container registry](https://docs.github.com/en/packages/working-with-a-github-packages-registry/working-with-the-container-registry#authenticating-to-the-container-registry) for more information.

```bash
echo $GITHUB_TOKEN | docker login ghcr.io -u USERNAME --password-stdin
docker pull ghcr.io/lowply/gcm-linux:latest
docker run -it --rm ghcr.io/lowply/gcm-linux:latest
```

Now try `git clone` your private repository in the container. You'll be asked to authenticate based on the [auth mode](https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/configuration.md#credentialgithubauthmodes) you choose.

## Initial authentication

You'll be asked to choose the [AuthMode](https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/configuration.md#credentialgithubauthmodes) in the initial clone. Here are the examples:

### Device code

```bash
root@50d697802a25:/home# git clone https://github.com/owner/repo.git
Cloning into 'repo'...
Select an authentication method for 'https://github.com/':
  1. Device code (default)
  2. Personal access token
option (enter for default):
To complete authentication please visit https://github.com/login/device and enter the following code:
XXXX-XXXX
```

You'll find the Git Credential Manager oauth app at https://github.com/settings/applications

### Personal access token

```bash
root@bc9ae762dac9:/home# git clone https://github.com/owner/repo.git
Cloning into 'repo'...
Select an authentication method for 'https://github.com/':
  1. Device code (default)
  2. Personal access token
option (enter for default): 2
Enter GitHub personal access token for 'https://github.com/'...
Token:
```

## Credential store

Because the purpose of this repository is to demonstrate how to get started with Git Credential Manager on a Linux system, `plaintext` is selected as the credential store. _Do not do the same on your production environment_. Please read [Credential stores](https://github.com/GitCredentialManager/git-credential-manager/blob/main/docs/credstores.md) for more information.

## Build

```bash
make build
```

## Further reading

- [Git Credential Manager: authentication for everyone | The GitHub Blog](https://github.blog/2022-04-07-git-credential-manager-authentication-for-everyone/)

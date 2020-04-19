# Configurations

## General
Install & update
- CLI: `brew` `vim` `git` `trash`
- Python: `pyenv` `python3 (pip3)`
- Node: `nvm` `node (npm)`
- Softwares: VSCode, Sublime Text, iTerm2
- Disable accent menu: `defaults write -g ApplePressAndHoldEnabled -bool false`


## PostgreSQL Setup

### Install
`brew install postgresql`

### To Start
- `brew services start postgresql`
- `pg_ctl -D /usr/local/var/postgres start`

### To Stop
- `brew services stop postgresql`
- `pg_ctl -D /usr/local/var/postgres stop`



## SSH Keys Setup

### You don't need ssh-key to access GitHub
- [It is being cached by `git credential-osxkeychain`](https://help.github.com/en/github/using-git/caching-your-github-password-in-git)
- To update the credentials see [this](https://help.github.com/en/github/using-git/updating-credentials-from-the-osx-keychain)


### To generate a new key pair
- `ssh-keygen -t rsa -b 4096 -C "your_email@example.com (*)"`
- Hit enter for the default new file location `~/.ssh/id_rsa`
- Choose a passphrase for the key. This will encrypt the private key so it is not stored in plain text on disk. To avoid entering it everytime, see section below.
- `*` You can put any comments here, like `"email@example.com (MacBook Pro 2020)"`

### To SSH to a different server without entering password every time
- Copy the public key onto the remote machine:  
`scp id_rsa.pub guest@host.name:~/`
- Ssh into the remote machine:  
`ssh guest@host.name`
- Append the key to the authorized keys and delete the file:  
`cat ~/id_rsa.pub >> ~/.ssh/authorized_keys && rm ~/id_rsa.pub`


#### To avoid entering the passphrase every time
1. Save the passphrase to the MacOS keychain
`ssh-add -K ~/.ssh/id_rsa` (Enter passphrase when prompted)

2. For MacOS to load the key automatically, copy this to `~/.ssh/config`
```
Host *
   AddKeysToAgent yes
   UseKeychain yes
   IdentityFile ~/.ssh/id_rsa
```


## Other References
- https://sourabhbajaj.com/mac-setup/

git config --global alias.s status
git config --global alias.a add
git config --global alias.c "commit -v"

git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.sw switch
git config --global alias.cp cherry-pick

git config --global alias.alias "!git config --list | grep 'alias\\.' | sed 's/alias\\.\\([^=]*\\)=\\(.*\\)/\\1\\\t => \\2/' | sort"

git config --global init.defaultBranch main
git config --global pull.ff only
git config --global advice.detachedhead false
git config --global push.autoSetupRemote true

# git config --list --show-origin

git config --global user.name "__REPLACE_WITH_NAME__"
git config --global user.email "__REPLACE_WITH_EMAIL__"

git config --global alias.s status
git config --global alias.a add
git config --global alias.c "commit -v"

git config --global alias.br branch
git config --global alias.co checkout
git config --global alias.sw switch
git config --global alias.cp cherry-pick

git config --global alias.l "log --oneline --graph"
git config --global alias.la "log --oneline --graph --all"
git config --global alias.pr 'git_push_and_pr'

git config --global alias.alias "!git config --list | grep 'alias\\.' | sed 's/alias\\.\\([^=]*\\)=\\(.*\\)/\\1\\\t => \\2/' | sort"

git config --global init.defaultBranch main
git config --global pull.ff only
git config --global advice.detachedhead false
git config --global push.autoSetupRemote true
git config --global merge.conflictStyle diff3

# To view all configs: git config --list --show-origin

git config --global user.email email@example.com
git config --global user.name Name

git config --global alias.s status
git config --global alias.br branch
git config --global alias.cm "commit -m"
git config --global alias.co checkout

git config --global alias.sw switch
git config --global alias.alias "!git config --list | grep 'alias\\.' | sed 's/alias\\.\\([^=]*\\)=\\(.*\\)/\\1\\\t => \\2/' | sort"

git config --global alias.l "log --oneline --graph"
git config --global alias.la "log --oneline --graph --all"


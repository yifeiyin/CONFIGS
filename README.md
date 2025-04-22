# CONFIGS

My git, zsh, vim, vscode configs.

## Highlights

**Git:**
- [`gs, gc, gco`](https://github.com/search?q=repo%3Ayifeiyin%2FCONFIGS+"alias+gco") for git status, commit, checkout
- [`gpr`](https://github.com/search?q=repo%3Ayifeiyin%2FCONFIGS+function+git_push_and_pr) to auto create a PR on GitHub based on branch history

**Oh-my-zsh:**
- [`vi-mode`](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/vi-mode): vim for current shell command
- [`autocd`](https://zsh.sourceforge.io/Intro/intro_16.html): cd by typing directory name only
- [`ctrl-r`](https://github.com/junegunn/fzf?tab=readme-ov-file#key-bindings-for-command-line) to search command history with [fzf](https://github.com/junegunn/fzf)
- [`ctrl-z`](https://github.com/search?q=repo%3Ayifeiyin%2FCONFIGS+fancy-ctrl-z) to suspend current command
- [`vimrc`](https://github.com/search?q=repo%3Ayifeiyin%2FCONFIGS+function+vimrc) to quickly edit shell rc file based on shell environment
- [`greph`](https://github.com/search?q=repo%3Ayifeiyin%2FCONFIGS+greph) find text with *grep*, *h*ighlight only, no filtering


**VSCode Keybindings:**
- <kbd>cmd 1-9</kbd>: Switch to editor tabs 1-9
- <kbd>cmd E</kbd>: Delete current line
- <kbd>cmd Q</kbd>: Quick open previous editor
- for more, see [vscode/](vscode/)

## Files

### Shell
- [`zshrc`](zshrc): used on my primary machines
- [`bashrc`](bashrc): used when zsh is not available (raspberry pi, cloud, etc)
- [`sh_aliases`](sh_aliases): used by both rc files
- [`vimrc`](vimrc): Vim configuration with plugins and settings

### Tools
- [`git-config.sh`](git-config.sh): one time script to set up global settings
- [`iterm-profile.json`](iterm-profile.json): iTerm2 color scheme and settings
- [`vscode/`](vscode/)


### Initial Setup

macOS Pre-requisites: [Homebrew](https://brew.sh/)

1. Install Xcode Command Line Tools:
	```bash
	xcode-select --install
	```

2. Disable accent menu:
	```bash
	defaults write -g ApplePressAndHoldEnabled -bool false
	```

3. Install essential tools:
	```bash
	# Oh My Zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

	# fzf
	brew install fzf

	# Python, Node, Bun
	brew install pyenv nvm
	curl -fsSL https://bun.sh/install | bash

	# Development tools
	brew install gh
	brew install --cask docker tableplus
	brew install --cask visual-studio-code iterm2 obsidian
	```


### Apply configs

Use
```bash
./apply
```

to copy `sh_aliases, vimrc, zshrc` from this repo to appropriate places. It will show a diff, ask for confirmation, and create a backup for each file.


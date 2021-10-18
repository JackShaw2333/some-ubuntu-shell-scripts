#!/bin/bash

set -euxo pipefail

apt install zsh

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install antigen
curl -L git.io/antigen > ~/antigen.zsh

cp ~/.zshrc ~/.zshrc.backup

cat>~/.zshrc<<EOF
source ~/antigen.zsh
antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle autojump
antigen bundle command-not-found

antigen theme ys

antigen apply
EOF

zsh

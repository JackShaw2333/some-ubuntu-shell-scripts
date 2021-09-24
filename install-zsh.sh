#!/bin/bash

set -euxo pipefail

apt install zsh

chsh -s /bin/zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# install antigen
curl -L git.io/antigen > antigen.zsh

cp ~/.zshrc ~/.zshrc.backup

cat>~/.zshrc<<EOF
source ~/antigen.zsh

antigen use oh-my-zsh

antigen bundle <<EOBUNDLES
git
command-not-found
zsh-user/zsh-syntax-highlighting
zsh-user/zsh-autosuggestions
zsh-user/zsh-completions
EOBUNDLES

antigen theme dracula/zsh

antigen apply
EOF

zsh

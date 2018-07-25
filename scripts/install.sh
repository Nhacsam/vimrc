#!/bin/sh
set -e

RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NO_COLOR='\033[0m'


cd ~/.vim_runtime

echo "${YELLOW}Installing Plugins${NO_COLOR}"

cd ./plugins/completion/LanguageClient-neovim/
sh ./install.sh
cd -

echo "${GREEN}Plugins installed${NO_COLOR}"


if command -v fzf >/dev/null 2>&1; then
  echo "${CYAN}FZF is already installed${NO_COLOR}"
else
  echo "${YELLOW}Installing Fzf, see more here : https://github.com/junegunn/fzf${NO_COLOR}"

  cp -R ./misc/fzf ~/.fzf
  ~/.fzf/install

  echo "${GREEN}FZF installed${NO_COLOR}"
fi


echo '
set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrc.vim
' > ~/.vimrc

mkdir -p ~/.config/nvim
cp ~/.vimrc ~/.config/nvim/init.vim


echo "${GREEN}Configuration installed ! Enjoy :-)${NO_COLOR}"

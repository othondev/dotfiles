#!/bin/bash
cd $HOME

function install {
  for program in "$@"
  do
    if ! [ -x "$(command -v $program)" ]; then
      echo "Error: $program is not installed."
      [ -x "$(command -v pacman)" ] && sudo pacman --noconfirm -S $program
      [ -x "$(command -v apt)" ] && sudo apt install -y $program
      [ -x "$(command -v yum)" ] && sudo yum install -y $program
      [ -x "$(command -v brew)" ] && brew install $program
    fi
  done
}

function createLink {
  rm -rf $2
  case "$(uname -s)" in
    Darwin)
      ln -s $1 $2
      ;;

    Linux)
      ln -s $1 $2
      ;;
  esac
}

install \
  autojump \
  curl \
  fzf \
  gawk \
  git \
  jq \
  npm \
  ripgrep \
  taskwarrior \
  tmux \
  vim \
  zsh

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

createLink $HOME/.dotfiles/tmux.conf ~/.tmux.conf
createLink $HOME/.dotfiles/zshrc ~/.zshrc
createLink $HOME/.dotfiles/zsh ~/.zsh
createLink $HOME/.dotfiles/vimrc ~/.vimrc
createLink $HOME/.dotfiles/vimrc ~/.config/nvim/init.vim
createLink $HOME/.vim/autoload/plug.vim ${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim

[ -d "$HOME/.dotfiles" ] || git clone https://gitlab.com/othondev/dotfiles.git $HOME/.dotfiles
[ -d "$HOME/.tmux/plugins/tpm" ] || git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
[ -d "$HOME/.zplug" ] || curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

[ $(echo $SHELL) = '/bin/zsh' ] || chsh -s `which zsh`

echo "Enviroment installed"

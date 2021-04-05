################################################################################
#                                                                     Plugins
#
################################################################################
source ~/.zplug/init.zsh
zplug Valodim/zsh-curl-completion
zplug cpitt/zsh-dotenv, as:plugin
zplug jimeh/zsh-peco-history, defer:2
zplug plugins/autojump, from:oh-my-zsh
zplug plugins/fzf, from:oh-my-zsh
zplug plugins/git, from:oh-my-zsh
zplug plugins/gitfast, from:oh-my-zsh
zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:github, as:theme
zplug zsh-users/zsh-autosuggestions
zplug zsh-users/zsh-completions
zplug zsh-users/zsh-syntax-highlighting, defer:2
if ! zplug check --verbose; then
  printf "Install? [y/N]: "
  if read -q; then
    echo; zplug install
  fi
fi
zplug load

################################################################################
#                                                                     General
#                                                               Configuration
#
################################################################################
export PATH=~/.local/bin:$PATH
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export ZSH=$HOME/.zsh/plugins/oh-my-zsh
export HISTFILE=~/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export VISUAL=nvim
export EDITOR=$VISUAL
setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_BEEP
export FZF_BASE=/tmp/fzf
autoload -U edit-command-line
zle -N edit-command-line
bindkey -e
bindkey '^xe' edit-command-line
bindkey '^x^e' edit-command-line
if [ -n "$SSH_CLIENT" ] || [ -n "$SSH_TTY" ]; then
  tmux attach -t TMUX || tmux new -s TMUX
fi
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

################################################################################
#                                                                   Appearance
#
################################################################################
ZSH_THEME="spaceship"

################################################################################
#                                                                     Mappings
#
################################################################################
for a in $HOME/.zsh/aliases/*.sh
do
  source $a
done

alias tmux="TERM=screen-256color-bce tmux"

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

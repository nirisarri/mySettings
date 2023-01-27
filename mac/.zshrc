eval "$(oh-my-posh --init --shell zsh --config ~/Personal/mySettings/nicpowerline.omp.json)"

export NVM_DIR=~/.NVM_DIR
source $(brew --prefix nvm)/nvm.sh
nvm use 16

export DOTNET_ROOT="/usr/local/opt/dotnet/libexec"

autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit

export EDITOR="vim"
export VISUAL="code"

# for _envtool in "pyenv"; do
#   if command -v "${_envtool}" > /dev/null 2>&1; then
#     eval "$(${_envtool} init --path)"
#   fi
# done
# for _envtool in "goenv" "jenv" "pyenv" "rbenv"; do
#   if command -v "${_envtool}" > /dev/null 2>&1; then
#     eval "$(${_envtool} init -)"
#   fi
# done

# if command -v pyenv 1>/dev/null 2>&1; then

#   eval "$(pyenv init -path)"
# fi

export PATH="~/.local/bin:${PATH}"

plugins=(
  git
  z
  docker
  docker-compose
)

if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi

. ~/z.sh

alias src= "source ~/.zshrc"

# Added by Amplify CLI binary installer
export PATH="$HOME/.amplify/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

function brew-list-formulas {
  if (($# == 0)); then
    echo "Please specify one or more taps whose formulas you want listed."
    echo "  e.g.: brew-list-formulas tap/tap othertap/othertap"
    echo ""
    echo "Available taps are:"
    echo ""
    brew tap
  else
    echo "Formulas for tap(s) $* are:"
    echo ""
    brew tap-info --json "$@" | jq -r '.[]|(.formula_names[],.cask_tokens[])' | sort -V
  fi
}

export LOCAL_DEBUG="true"

alias ll='exa -alFg --git'
alias la='exa -aF'
alias l='exa -FG'
alias ls="exa -F"

alias d='docker'
alias dc='docker-compose'
alias dcup='docker-compose up -d'
alias dss='docker stack services'
alias ds='docker stack'

alias tf='terraform'

alias cat="bat"
alias cat2="cat"
alias thanos="rm -rf"

# ---------------------------
export ISG_ID="469773013489"
export ISG_USERNAME="nicdeiri"
export ISG_ROLE="Admin"

alias isg='isengardcli'
alias isgnic="isengardcli assume --region us-east-1 ${ISG_USERNAME}"
alias isgassumeroleadmin="source ~/assumeRole.sh --account ${ISG_ID} --role ${ISG_ROLE}"

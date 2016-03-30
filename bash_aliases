# pushd popd aliases
alias pd='pushd'
alias od='popd'

# Add untracked files to gitignore TODO make this check for .gitignore's location
alias gi='git status -s | grep -e "^\?\?" | cut -c 4- >> .gitignore '

# make colors work?
alias tmux="TERM=screen-256color-bce tmux"
# tmux aliases
alias ts='tmux new-session -s'

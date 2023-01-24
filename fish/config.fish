set -U fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

starship init fish | source
# fish_config theme save "Catppuccin Mocha"

alias sebas="cd /mnt/d/sebas"
alias eia="cd /mnt/d/EIA"
alias mg5="sudo /home/sebastian/MG5_aMC_v2_9_13/bin/mg5_aMC"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /home/sebastian/mambaforge/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<


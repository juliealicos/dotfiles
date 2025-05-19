# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jalicos/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/jalicos/.fzf/bin"
fi
export FZF_DEFAULT_OPTS="
--tmux 70%
--border
--preview 'batcat --style=numbers --color=always {} || cat {}'
--preview-window=right:60%
--multi
--ansi
# --bind 'enter:execute(tmux send-keys \"vim {}\" Enter),esc:abort'
--bind 'enter:execute(vim {})'
"

# Dracula theme for fzf
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9"
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --color=fg+:#f8f8f2,bg+:#282a36,hl+:#bd93f9"
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6"
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4"
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --color=border:#6271A4"

# Override options for history search (Ctrl+R)
export FZF_CTRL_R_OPTS="--bind 'enter:accept' --preview ''"

eval "$(fzf --bash)"


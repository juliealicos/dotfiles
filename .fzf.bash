# Setup fzf
# ---------
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
--color=dark
--color=fg:-1,bg:-1,hl:#5fff87,fg+:-1,bg+:-1,hl+:#ffaf5f
--color=info:#af87ff,prompt:#5fff87,pointer:#ff87d7,marker:#ff87d7,spinner:#ff87d7
'
export FZF_DEFAULT_OPTS="${FZF_DEFAULT_OPTS} --layout=reverse --border --multi --bind=ctrl-a:select-all,ctrl-d:deselect-all,F2:toggle-preview"

if [[ ! "$PATH" == */home/gravador/Downloads/fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/gravador/Downloads/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/gravador/Downloads/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/gravador/Downloads/fzf/shell/key-bindings.bash"

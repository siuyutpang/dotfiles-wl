# fpath+=${XDG_CONFIG_HOME}/zsh/comp.d

setopt complete_in_word
setopt always_to_end
setopt complete_aliases
setopt menu_complete

# Basic auto/tab complete:
autoload -U compinit

# zstyle ':completion:*' menu yes select
zstyle ':completion:*' menu select
# zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' matcher-list \
    'm:{[:lower:]}={[:upper:]}' \
    '+r:|[._-]=* r:|=*' \
    '+l:|=*'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# zmodload zsh/complist
# compinit 由 zinit 的 zicompinit（见 .zshrc 的 atinit）统一负责，延迟到提示符后执行，
# 这里不再重复调用。

# Include hidden files.
setopt globdots
# _comp_options+=(globdots)

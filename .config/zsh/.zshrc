# Sy's config for the Zoomer Shell

#: zinit settings {{{

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

[ ! -d "$ZINIT_HOME/.git" ] && mkdir -p "$(dirname "$ZINIT_HOME")" && \
    git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"

declare -A ZINIT
ZINIT[ZCOMPDUMP_PATH]="${XDG_CACHE_HOME:-${HOME}/.cache}/zsh/zcompdump-$ZSH_VERSION"

source "${ZINIT_HOME}/zinit.zsh"

# vi 模式必须立即可用，保持同步加载
zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# 其余插件用 Turbo 延后到提示符之后加载
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

#: }}}

#: load stuff {{{

# Load all of the lib files in $ZDOTDIR/lib that end in .zsh
if [ -d ~/.config/zsh/lib ]; then
    for lib_file in ~/.config/zsh/lib/*.zsh(N); do
        [ -e "$lib_file" ] && source "$lib_file"
    done
    unset lib_file
fi

# Load all of the plugins in $ZDOTDIR/plugins that end in .zsh
if [ -d ~/.config/zsh/plugins ]; then
    for plugin in ~/.config/zsh/plugins/*.zsh(N); do
        [ -e "$plugin" ] && source "$plugin"
    done
    unset plugin
fi

# Load shell-agnostic stuff

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/arsenal" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/arsenal"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/environ" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/environ"

#: }}}

#: shell integration {{{

source <(fzf --zsh)

eval "$(zoxide init zsh)"

eval "$(direnv hook zsh)"

export ATUIN_NOBIND="true"
eval "$(atuin init zsh)"
bindkey '^[r' _atuin_search_widget

eval "$(starship init zsh --print-full-init)"

#: }}}

# vim:fileencoding=utf-8:foldmethod=marker

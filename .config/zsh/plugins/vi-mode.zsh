# Runs after zsh-vi-mode completes its lazy initialization; its init rebinds
# keys in viins mode, so custom keybindings are (re-)applied here.
function zvm_after_init() {
  bindkey -M viins '^R' fzf-history-widget
  bindkey -M viins '^[r' atuin-search-viins
}

# Changing/making/removing directory
setopt auto_cd
setopt auto_pushd
setopt pushd_silent
setopt pushd_ignore_dups
setopt pushdminus

alias -- -='cd -'

for index in {1..9}; do
    alias "$index"="cd -${index}"
done
unset index

function d () {
  if [[ -n $1 ]]; then
    dirs "$@"
  else
    dirs -v | head -n 10
  fi
}
# compinit 延迟到提示符后（zinit Turbo），此时 compdef 可能还不存在，
# 用 zinit 的 zicompdef 先排队，稍后由 zicdreplay 补执行。
if (( ${+functions[compdef]} )); then
    compdef _dirs d
else
    zicompdef _dirs d
fi

" repair cursor problem in neovim.
au VimEnter,VimResume * set guicursor=n-v-r:block,i-c-ci-ve:ver25,cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon0-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon0

au VimLeave,VimSuspend * set guicursor=a:ver25-blinkon0

au VimEnter,WinEnter,BufWinEnter * hi Normal ctermbg=none guibg=none

" au BufNewFile *.sh 0r ~/.config/nvim/skel/header.txt

" au BufNewFile *.sh :call AddHeaderInfo() | norm 8G
au BufNewFile *.sh :call AddHeaderInfo() | startinsert! | norm ,,
function! AddHeaderInfo()
    call setline(1, "#!/usr/bin/env bash")
    call setline(2, "")
    call setline(3, "# ====================================================")
    call setline(4, "#    Filename:      ".expand("%:t"))
    call setline(5, "#    Date:          ".strftime("%Y-%m-%d %H:%M"))
    call setline(6, "#    Author:        siuyutpang")
    call setline(7, "#    Email:         siuyutpang@gmail.com")
    call setline(8, "#    Description:    <++>")
    call setline(9, "# ====================================================")
    call setline(10, "")
    call setline(11, "<++>")
endfunction

" auto delete trailing whitespace & reset cursor position
autocmd BufWritePre * let currPos = getpos(".")
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * cal cursor(currPos[1], currPos[2])

let fcitx5state=system("fcitx5-remote")
au VimEnter * :silent call system("fcitx5-remote -s keyboard-us")
au InsertLeave * :silent let fcitx5state=system("fcitx5-remote -n") | silent call system("fcitx5-remote -s keyboard-us")
au InsertEnter * :silent if fcitx5state == "rime\n" | call system("fcitx5-remote -s rime") | endif

" .gvimrc用の自動コマンドグループ。
augroup gvimrc_autocmd
    autocmd!
augroup END

" ############################################################
" システム設定 {{{
" ############################################################
set guioptions-=m       " メニューバーを非表示。
set guioptions-=T       " ツールバーを非表示。
set guioptions-=rRlLb   " スクロールバーを非表示。

let g:wininfo_file = expand('$HOME/.vimwininfo')    " ウィンドウの状態を保存するファイル。

" ウィンドウの状態を保存。
function! s:saveWindowInfo()
    let options = [
                \ 'set columns=' . &columns,
                \ 'set lines=' . &lines,
                \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
                \ ]
    call writefile(options, g:wininfo_file)
endfunction
autocmd gvimrc_autocmd VimLeavePre * call s:saveWindowInfo()
" }}}



" ############################################################
" 表示 {{{
" ############################################################
" 前回のウィンドウの状態を読み込み。
if filereadable(g:wininfo_file)
    execute 'source ' . g:wininfo_file
endif

set guifont=Ricty\ for\ Powerline\ 13   " 使用するフォントのリスト。
" }}}

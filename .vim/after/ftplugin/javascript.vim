" ############################################################
" 前処理 {{{
" ############################################################
let s:_cpoptions = &cpoptions   " 'cpoptions'の値を保存。

" 'b:undo_ftplugin'の値を保存。
let s:_undo_ftplugin = ''
if exists('b:undo_ftplugin')
    let s:_undo_ftplugin = b:undo_ftplugin
endif

set cpoptions-=C    " '\'で始まる行を連結しない。
" }}}



" ############################################################
" メイン処理 {{{
" ############################################################
setlocal commentstring=//\ %s   " コメント文字列。

compiler javascript " コンパイラーを設定。

" コンパイラーを一時的に変更して`:make`。
nnoremap <silent><buffer> <LocalLeader>mh :<C-u>MakeWith jshint<CR>
nnoremap <silent><buffer> <LocalLeader>ml :<C-u>MakeWith rhinoed_jslint<CR>

" コンパイラーを一時的に変更して`:lmake`。
nnoremap <silent><buffer> <LocalLeader>lmh :<C-u>LMakeWith jshint<CR>
nnoremap <silent><buffer> <LocalLeader>lml :<C-u>LMakeWith rhinoed_jslint<CR>
" }}}



" ############################################################
" 後処理 {{{
" ############################################################
" ファイルタイププラグインをリセットするコマンド。
let b:undo_ftplugin = 'setlocal commentstring<' .
            \ ' | unlet! b:current_compiler' .
            \ ' | silent! execute "nunmap <buffer> <LocalLeader>mh"' .
            \ ' | silent! execute "nunmap <buffer> <LocalLeader>ml"' .
            \ ' | ' . s:_undo_ftplugin

let &cpoptions = s:_cpoptions   " 'cpoptions'の値を元に戻す。

" 内部変数を削除。
unlet s:_cpoptions
unlet s:_undo_ftplugin
" }}}

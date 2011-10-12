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
setlocal commentstring=<!--\ %s\ -->    " コメント文字列。

let g:xml_syntax_folding = 1    " シンタックスハイライトのキーワードによる折り畳みを有効化。
" }}}



" ############################################################
" 後処理 {{{
" ############################################################
" ファイルタイププラグインをリセットするコマンド。
let b:undo_ftplugin = 'setlocal commentstring<' .
            \ ' | unlet! g:xml_syntax_folding' .
            \ ' | ' . s:_undo_ftplugin

let &cpoptions = s:_cpoptions   " 'cpoptions'の値を元に戻す。

" 内部変数を削除。
unlet s:_cpoptions
unlet s:_undo_ftplugin
" }}}

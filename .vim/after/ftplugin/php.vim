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
setlocal commentstring=/*\ %s\ */   " コメント文字列。

compiler php    " コンパイラーを設定。

" コンパイラーを一時的に変更して`:make`。
nnoremap <silent><buffer> <LocalLeader>mz :<C-u>MakeWith phpcs_zend<CR>
nnoremap <silent><buffer> <LocalLeader>mp :<C-u>MakeWith phpcs_pear<CR>

" コンパイラーを一時的に変更して`:lmake`。
nnoremap <silent><buffer> <LocalLeader>lmz :<C-u>LMakeWith phpcs_zend<CR>
nnoremap <silent><buffer> <LocalLeader>lmp :<C-u>LMakeWith phpcs_pear<CR>

let g:php_sql_query     = 1 " 文字列中のSQLをシンタックスハイライトを有効化。
let g:php_htmlInStrings = 1 " 文字列中のHTMLをシンタックスハイライトを有効化。
let g:php_noShortTags   = 1 " ショートタグを('<?'、'?>')をPHPとして扱わない。
let g:php_folding       = 1 " クラスと関数を折り畳み。
" }}}



" ############################################################
" 後処理 {{{
" ############################################################
" ファイルタイププラグインをリセットするコマンド。
let b:undo_ftplugin = 'setlocal commentstring<' .
            \ ' | unlet! b:current_compiler' .
            \ ' | unlet! g:php_sql_query g:php_htmlInStrings g:php_noShortTags g:php_folding' .
            \ ' | ' . s:_undo_ftplugin

let &cpoptions = s:_cpoptions   " 'cpoptions'の値を元に戻す。

" 内部変数を削除。
unlet s:_cpoptions
unlet s:_undo_ftplugin
" }}}

set nocompatible    " VimをVi互換にしない。

scriptencoding utf-8    " スクリプトで使用している文字エンコーディング。

" Vimの動作環境。
" Windows?
let s:is_win = has('win16') || has('win32') || has('win64') || has('win32unix')
" Mac?
let s:is_mac = !s:is_win && (has('mac') || has('macunix') || has('gui_macvim') || system('uname') =~? '^darwin')
" Unix?
let s:is_unix = !s:is_win && !s:is_mac && has('unix')
" GUI版?
let s:is_gui = has('gui_running')

set shellslash  " ファイル名の展開にスラッシュを使用(MS-DOS、Windows、OS/2用)。

filetype off    " ファイルタイプの検出を無効化。

" .vimrc用の自動コマンドグループ。
augroup vimrc_autocmd
    autocmd!
augroup END

" ############################################################
" ランタイムパス {{{
" ############################################################
if has('vim_starting')
    " ランタイムファイルが検索されるディレクトリのリスト。
    " 最初に'$HOME/.vim'、最後に'$HOME/.vim/after'を追加(Windows用)。
    if s:is_win
        let &runtimepath = join([
                        \ expand('$HOME/.vim'),
                        \ &runtimepath,
                        \ expand('$HOME/.vim/after')
                    \ ], ',')
    endif
    " NeoBundleのパスを追加。
    let &runtimepath = join([
                    \ &runtimepath,
                    \ expand('$HOME/.bundle/neobundle.vim')
                \ ], ',')
endif
" }}}



" ############################################################
" パッケージの読み込み {{{
" ############################################################
call neobundle#rc(expand('$HOME/.bundle'))      " NeoBundleを初期化。

" **************************************************
" プラグイン {{{
" **************************************************
NeoBundle 'Shougo/neobundle.vim'                    " NeoBundle                      : パッケージマネージャー。
NeoBundle 'vim-jp/vimdoc-ja'                        " vimdoc-ja                      : 日本語のヘルプファイル。
NeoBundle 'Shougo/vimproc'                          " VimProc                        : 非同期実行ライブラリ。
NeoBundle 'Shougo/neocomplcache'                    " NeoComplCache                  : キーワード補完。
NeoBundle 'Shougo/neocomplcache-snippets-complete'  " neocomplcache-snippets-complete: スニペット補完(NeoComplCacheソース)。
NeoBundle 'savevers.vim'                            " Savevers                       : ファイルの世代管理・差分表示。
NeoBundle 'kana/vim-submode'                        " Submode                        : Vimモードにサブモードを定義。
NeoBundle 'YankRing.vim'                            " YankRing                       : ヤンク、削除テキストの管理。
NeoBundle 'matchit.zip'                             " Matchit                        : 括弧等の組を構成する文字を拡張。
NeoBundle 'tpope/vim-surround'                      " Surround                       : 括弧等の組を構成する文字の削除・変更・追加。
NeoBundle 'tpope/vim-repeat'                        " Repeat                         : プラグインの関数を繰り返しコマンドに対応させる。
NeoBundle 'Raimondi/delimitMate'                    " DelimitMate                    : 括弧等の組を構成する文字を自動で閉じる。
NeoBundle 'chrisbra/SudoEdit.vim'                   " SudoEdit                       : sudoやsu等を利用してファイルを読み書き。
" NeoBundle 'godlygeek/csapprox'                      " CSApprox                       : [重い] GVim専用のカラースキームを端末用に変換。
NeoBundle 'Gundo'                                   " Gundo                          : アンドゥツリーをグラフ表示。
NeoBundle 'netrw.vim'                               " Netrw                          : ファイルエクスプローラー(ファイラー)。
NeoBundle 'Shougo/vimfiler'                         " VimFiler                       : ファイルエクスプローラー(ファイラー)。
NeoBundle 'scrooloose/nerdtree'                     " NERD tree                      : ツリー形式のファイルエクスプローラー。
NeoBundle 'The-NERD-Commenter'                      " NERD Commenter                 : コメントの操作・整形。
NeoBundle 'majutsushi/tagbar'                       " Tagbar                         : ソースコードのタグを一覧表示。
NeoBundle 'Lokaltog/vim-powerline'                  " Powerline                      : ステータスラインの外観・機能を拡張。
NeoBundle 'h1mesuke/vim-alignta'                    " Align Them All!                : テキストを整列。
NeoBundle 'Lokaltog/vim-easymotion'                 " EasyMotion                     : モーションの使用を容易にする。
NeoBundle 'kien/tabman.vim'                         " TabMan                         : タブとウィンドウを管理。
NeoBundle 'kana/vim-altr'                           " Altr                           : 定義したルールを元にファイルを切り替える。
NeoBundle 'scrooloose/syntastic'                    " Syntastic                      : シンタックスチェック。
NeoBundle 'nathanaelkane/vim-indent-guides'         " Indent Guides                  : インデントの深さを可視化。
NeoBundle 'jceb/vim-hier'                           " Hier                           : QuickFixリスト・ローケーションリストのエラーを強調表示。
NeoBundle 'Shougo/vimshell'                         " VimShell                       : シェル。
NeoBundle 'rson/vim-conque'                         " Conque                         : ターミナルエミュレーター。
NeoBundle 'tpope/vim-git'                           " Git                            : Gitのシンタックスハイライト・インデントファイル・ファイルタイププラグイン。
NeoBundle 'tpope/vim-fugitive'                      " Fugitive                       : Gitラッパー。
NeoBundle 'mattn/webapi-vim'                        " webapi-vim                     : Web APIのVimインターフェイス。
NeoBundle 'mattn/gist-vim'                          " Gist                           : Gistを作成・管理。
NeoBundle 'Phize/QFixToggle'                        " QFixToggle                     : QuickFixウィンドウの表示をトグル。
NeoBundle 'thinca/vim-qfreplace'                    " Qfreplace                      : クリックフィックスリスト内のテキストを置換。
NeoBundle 'othree/eregex.vim'                       " Eregex                         : 拡張正規表現をVimの正規方言に変換。
" NeoBundle 'kana/vim-arpeggio'                   " Arpeggio                           : [動かない] キーマッピングでキーの同時押しをシミュレート。
NeoBundle 'mattn/zencoding-vim'                     " ZenCoding                      : Zen Codingプラグイン。
NeoBundle 'myusuf3/numbers.vim'                     " numbers.vim                    : 行番号表示を自動切り替え。
NeoBundle 'ujihisa/quickrun'                        " QuickRun                       : 編集中のファイルの全体または一部を実行。
NeoBundle 'austintaylor/vim-commaobject'            " Comma Object                   : カンマ区切りの文字列をテキストオブジェクトとして扱う。
NeoBundle 'PDV--phpDocumentor-for-Vim'              " PDV                            : phpDocument形式のDocBlockコメントを生成。
NeoBundle 'arnaud-lb/vim-php-namespace'             " vim-php-namespace              : PHPのuse文を自動挿入。
NeoBundle 'techlivezheng/phpctags'                  " phpctags                       : PHPのctagsインデックスファイルジェネレーター。
NeoBundle 'techlivezheng/tagbar-phpctags'           " tagbar-phpctags                : phpctagsを利用したtagbarのアドオンプラグイン。
NeoBundle 'docteurklein/vim-symfony'                " vim-symfony                    : Symfonyのルーティング、DIコンテナーを補完。
" NeoBundle 'hallettj/jslint.vim'                 " JSLint                             : [重い] JavaScript LintをVimに統合。
NeoBundle 'Rykka/riv.vim'                           " Riv                            : reStructuredTextドキュメントを管理。
NeoBundle 'DrawIt'                                  " DrawIt                         : テキストで図を描画。
NeoBundle 'Rykka/ColorV'                            " ColorV                         : 色を選択・取得・編集・一覧表示。
NeoBundle 'tsukkee/lingr-vim.git'                   " Lingr                          : Lingrクライアント。
" NeoBundle 'ChrisYip/Better-CSS-Syntax-for-Vim'  " Better CSS Syntax for Vim          : [他のプラグインと衝突] CSS2、HTML5、CSS3のシンタックスハイライト。
NeoBundle 'miripiruni/CSScomb-for-Vim'              " CSScomb for Vim                : CSSプロパティを並べ替え。
NeoBundle 'beyondwords/vim-twig'                    " vim-twig                       : Twigのシンタックスハイライト。
NeoBundle 'potix2/vim-phprefactor'                  " phprefactor                    : PHP用のリファクタリングブラウザー。
NeoBundle 'hail2u/vim-css3-syntax'                  " vim-css3-syntax                : CSS3のシンタックスハイライト。
NeoBundle 'cakebaker/scss-syntax.vim'               " scss-syntax                    : SCSSのシンタックスハイライト。
NeoBundle 'Phize/vim-rainbow_pairs'                 " Rainbow Pairs                  : 括弧等の組を構成する文字を強調表示。
NeoBundle 'Phize/foldCC'                            " FoldCC                         : 折り畳みの表示テキスト等で使用する関数。



" ========================================
" Unite {{{
" ========================================
NeoBundle 'Shougo/unite.vim'            " Unite            : 統合インターフェイス。
NeoBundle 'h1mesuke/unite-outline'      " unite-outline    : 見出しを一覧表示(Uniteソース)。
NeoBundle 'tacroe/unite-mark'           " unite-mark       : マークを一覧表示(Uniteソース)。
NeoBundle 'ujihisa/unite-colorscheme'   " unite-colorscheme: カラースキームを一覧表示(Uniteソース)。
" NeoBundle 'Shougo/unite-build'          " unite-build      : ビルド結果を一覧表示(Uniteソース)。
NeoBundle 'tsukkee/unite-help'          " unite-help       : ヘルプを一覧表示(Uniteソース)。
NeoBundle 'tsukkee/unite-tag'           " unite-tag        : タグを一覧表示(Uniteソース)。
NeoBundle 'thinca/vim-unite-history'    " vim-unite-history: コマンドと検索の履歴を一覧表示(Uniteソース)。
NeoBundle 'Shougo/unite-session'        " unite-session    : Vimのセッションを管理(Uniteソース)。
" }}}

" ========================================
" Ref {{{
" ========================================
NeoBundle 'thinca/vim-ref'              " Ref         : リファレンスビューアー。
NeoBundle 'mojako/ref-sources.vim.git'  " ref-sources : 英辞郎、CPAN、jQAPI、コトバンク、Wikipediaを参照(Refソース)。
NeoBundle 'mfumi/ref-dicts-en.git'      " ref-dicts-en: Answer.com、Reverso、Hyper Dictionary、Longman、Oxford Dictionaries、Synonym.comを参照(Refソース)。
" }}}

" ========================================
" テキストオブジェクト {{{
" ========================================
NeoBundle 'kana/vim-textobj-user'       " textobj-user    : ユーザー定義テキストオブジェクト。
NeoBundle 'kana/vim-textobj-entire'     " textobj-entire  : バッファー全体(テキストオブジェクト)。
NeoBundle 'kana/vim-textobj-line'       " textobj-line    : 現在の行(テキストオブジェクト)。
NeoBundle 'thinca/vim-textobj-between'  " textobj-between : 任意の文字の間(テキストオブジェクト)。
NeoBundle 'kana/vim-textobj-datetime'   " textobj-datetime: 日付・時間(テキストオブジェクト)。
NeoBundle 'kana/vim-textobj-indent'     " textobj-indent  : インデント(テキストオブジェクト)。
NeoBundle 'kana/vim-textobj-fold'       " textobj-fold    : 折り畳み(テキストオブジェクト)。
" }}}

" ========================================
" オペレーター {{{
" ========================================
NeoBundle 'kana/vim-operator-user'          " operator-user       : ユーザー定義オペレーター。
NeoBundle 'tyru/operator-html-escape.vim'   " operator-html-escape: HTMLの文字実体参照に変換(オペレーター)。
" }}}

" }}}

" **************************************************
" カラースキーム {{{
" **************************************************
NeoBundle 'tomasr/molokai'                      " Molokai(GUI版/256色端末)
NeoBundle 'wombat256.vim'                       " Wombat(GUI版/256色端末)
NeoBundle 'Wombat'                              " [GUI版専用] Wombat
NeoBundle 'BusyBee'                             " BusyBee(GUI版/256色端末)
NeoBundle 'Lucius'                              " Lucius(GUI版/256色端末)
NeoBundle 'desert256.vim'                       " Desert(256色端末専用)
NeoBundle 'fugalh/desert.vim'                   " Desert(GUI版/8色端末)
NeoBundle 'jnurmine/Zenburn'                    " Zenburn(GUI版/256色端末)
NeoBundle 'altercation/vim-colors-solarized'    " Solarized(GUI版/256色端末/16色端末)
NeoBundle 'noahfrederick/Hemisu'                " Hemisu(GUI版/256食端末)
NeoBundle 'chriskempson/Vim-Tomorrow-Theme'     " Tomorrow Theme(GUI版/256色端末)
NeoBundle 'twilight'                            " [GUI版専用] Twilight
" }}}

" ファイルタイプ別のプラグインとインデントを有効化。
filetype plugin on
filetype indent on
" }}}



" ############################################################
" システム設定 {{{
" ############################################################
" .vimrc、.gvimrcの書き込み後に再読み込み。
if s:is_gui
    autocmd vimrc_autocmd BufWritePost $MYVIMRC  nested source $MYVIMRC | source $MYGVIMRC
    autocmd vimrc_autocmd BufWritePost $MYGVIMRC nested source $MYGVIMRC
else
    autocmd vimrc_autocmd BufWritePost $MYVIMRC  nested source $MYVIMRC
endif

" 外部で変更のあったファイルを自動的に再読み込み。
autocmd vimrc_autocmd WinEnter * checktime

" マウスの利用モード。
" set mouse=a " ノーマル、ビジュアル、挿入、Exモードでマウスを使用。
set mouse=  " マウスを無効化。

" マウスと選択の動作。
" if s:is_win
    " behave mswin
" else
    " behave xterm
" end

" **************************************************
" viminfoファイル {{{
" **************************************************
" viminfoファイルのパラメーター。
" viminfoファイルの名前。
let &viminfo = join([
                \ &viminfo,
                \ 'n' . expand('$HOME/.viminfo')
            \ ], ',')
" }}}

" **************************************************
" アンドゥファイル {{{
" **************************************************
let &undodir = expand('$HOME/.vimundo') " アンドゥファイル用のディレクトリのリスト。
set undolevels=1000                     " アンドゥ可能な変更の最大値。
" set undoreload=10000                    " リロードのアンドゥ用にバッファー全体を保存するときに、保存対象とするバッファーの最大行数。
set undofile                            " アンドゥ履歴を自動的に保存・復元。
" }}}

" **************************************************
" スワップファイル {{{
" **************************************************
let &directory = expand('$HOME/.vimswap')   " スワップファイル用のディレクトリ。
set swapfile                                " バッファーでスワップファイルを使用。
" }}}

" **************************************************
" バックアップ {{{
" **************************************************
let &backupdir = expand('$HOME/.vimbackup') " バックアップファイル用のディレクトリ。

" バックアップファイル名の接尾辞。
" ファイルを書き込む直前に拡張子にタイムスタンプを含める。
" autocmd vimrc_autocmd BufWritePre * let &backupext = '-' . strftime('%Y%m%d_%H%M%S') . '~'

" ファイルの最も古いバージョンが保管される際のファイル名の接尾辞。
set patchmode=.clean    " ファイルの最も古いバージョンを保管する。

" バックアップファイルを作成しないファイル名のパターンのリスト。
set backupskip& " 設定を既定値に初期化。
" 最も古いバージョンのバックアップファイルのバックアップを作成しない。
execute 'set backupskip+=*' . &patchmode

" ワイルドカードにマッチしたときに優先順位を低くするファイルの拡張子。
" 最も古いバージョンのバックアップファイルの優先順位を低くする。
execute 'set suffixes+=' . &patchmode

" ファイル・ディレクトリ名の補完時に無視されるファイルパターンのリスト。
" 最も古いバージョンのバックアップファイルを無視。
execute 'set wildignore+=*' . &patchmode

" ファイルの上書き前にバックアップを作成。
" (古いバックアップを消去し、カレントファイルをバックアップ。)
set backup

" ファイルの上書き前にバックアップを作成。
" ('backup'が無効な場合は上書きの成功後にバックアップを削除。)
set writebackup
" }}}

" **************************************************
" ビュー {{{
" **************************************************
let &viewdir = expand('$HOME/.vimview') " ビューの保存(`:mkview`)でファイルを格納するディレクトリ名。
" set viewoptions=folds,options,cursor    " ビューの保存(`:mkview`)で保存・復元を有効化する項目のリスト。
" }}}

" }}}



" ############################################################
" 文字エンコーディング {{{
" ############################################################
set encoding=utf-8  " Vimの内部文字エンコーディング。

" 文字エンコーディングを自動認識。
if &encoding !=# 'utf-8'
    set encoding=japan      " Vimの文字エンコーディング。
    set fileencoding=japan  " ファイルの文字エンコーディング。
endif
if has('iconv')
    let s:enc_euc = 'euc-jp'
    let s:enc_jis = 'iso-2022-jp'
    " iconvがeucJP-msに対応しているかをチェック。
    if iconv("\x87\x64\x87\x6a", 'cp932', 'eucjp-ms') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'eucjp-ms'
        let s:enc_jis = 'iso-2022-jp-3'
        " iconvがJISX0213に対応しているかをチェック。
    elseif iconv("\x87\x64\x87\x6a", 'cp932', 'euc-jisx0213') ==# "\xad\xc5\xad\xcb"
        let s:enc_euc = 'euc-jisx0213'
        let s:enc_jis = 'iso-2022-jp-3'
    endif
    " 'fileencodings'を設定。
    if &encoding ==# 'utf-8'
        let s:fileencodings_default = &fileencodings
        let &fileencodings = s:enc_jis . ',' . s:enc_euc . ',cp932'
        let &fileencodings = &fileencodings . ',' . s:fileencodings_default
        unlet s:fileencodings_default
    else
        let &fileencodings = &fileencodings . ',' . s:enc_jis
        set fileencodings+=utf-8,ucs-2le,ucs-2
        if &encoding =~# '^\(euc-jp\|euc-jisx0213\|eucjp-ms\)$'
            set fileencodings+=cp932
            set fileencodings-=euc-jp
            set fileencodings-=euc-jisx0213
            set fileencodings-=eucjp-ms
            let &encoding = s:enc_euc
            let &fileencoding = s:enc_euc
        else
            let &fileencodings = &fileencodings . ',' . s:enc_euc
        endif
    endif
    " 内部変数を削除。
    unlet s:enc_euc
    unlet s:enc_jis
endif

" 日本語を含まないバッファーの'fileencoding'を'encoding'に変更。
function! s:recheckFenc()
    if &fileencoding =~# 'iso-2022-jp' && search("[^\x01-\x7e]", 'n') == 0
        let &fileencoding = &encoding
    endif
endfunction
autocmd vimrc_autocmd BufReadPost * call s:recheckFenc()

set fileformats=unix,dos,mac    " 想定される改行の種類。

" ユーロ、登録商標記号、著作権記号、ギリシャ文字、キリル文字等の扱い。
set ambiwidth=double    " ASCII文字の2倍の幅を使用。

" ヘルプで使用する言語のリスト。
set helplang=ja " 日本語のヘルプがあるときは日本語を優先。

" 文字エンコーディングを指定してファイルを再読み込み。
command! -bang -bar -complete=file -nargs=? Utf8      edit<bang> ++enc=utf-8       <args>
command! -bang -bar -complete=file -nargs=? Iso2022jp edit<bang> ++enc=iso-2022-jp <args>
command! -bang -bar -complete=file -nargs=? Cp932     edit<bang> ++enc=cp932       <args>
command! -bang -bar -complete=file -nargs=? Euc       edit<bang> ++enc=euc-jp      <args>
command! -bang -bar -complete=file -nargs=? Utf16     edit<bang> ++enc=ucs-2le     <args>
command! -bang -bar -complete=file -nargs=? Utf16be   edit<bang> ++enc=ucs-2       <args>
" エイリアス。
command! -bang -bar -complete=file -nargs=? Jis       Iso2022jp<bang> <args>
command! -bang -bar -complete=file -nargs=? Sjis      Cp932<bang>     <args>
command! -bang -bar -complete=file -nargs=? Unicode   Utf16<bang>     <args>

" ファイルの書き出し時の文字エンコーディングを設定。
command! WUtf8      setlocal fenc=utf-8
command! WIso2022jp setlocal fenc=iso-2022-jp
command! WCp932     setlocal fenc=cp932
command! WEuc       setlocal fenc=euc-jp
command! WUtf16     setlocal fenc=ucs-2le
command! WUtf16be   setlocal fenc=ucs-2
" エイリアス。
command! WJis       WIso2022jp
command! WSjis      WCp932
command! WUnicode   WUtf16

" 改行コードを指定してファイルを再読み込み。
command! -bang -bar -complete=file -nargs=? Unix  edit<bang>  ++fileformat=unix <args>
command! -bang -bar -complete=file -nargs=? Mac   edit<bang>  ++fileformat=mac  <args>
command! -bang -bar -complete=file -nargs=? Dos   edit<bang>  ++fileformat=dos  <args>

" 改行コードを指定してファイルを書き込み。
command! -bang -complete=file -nargs=? WUnix write<bang> ++fileformat=unix <args> | edit <args>
command! -bang -complete=file -nargs=? WMac  write<bang> ++fileformat=mac  <args> | edit <args>
command! -bang -complete=file -nargs=? WDos  write<bang> ++fileformat=dos  <args> | edit <args>
" }}}



" ############################################################
" カラースキーム {{{
" ############################################################
" 端末で利用できる色数。
if !s:is_gui
    set t_Co=256    " 256色に設定。
endif

" カラースキームを読み込み。
" Molokai。
" let g:molokai_original = 1  " オリジナル(Monokai)の背景色を使用。
colorscheme molokai
" スペルチェッカーによるハイライトを上書き。
highlight SpellBad   ctermfg=196 ctermbg=NONE cterm=undercurl
highlight SpellCap   ctermfg= 63 ctermbg=NONE cterm=undercurl
highlight SpellLocal ctermfg= 87 ctermbg=NONE cterm=undercurl
highlight SpellRare  ctermfg=231 ctermbg=NONE cterm=undercurl

" set background=dark " 背景色(既定値が適切でない場合)。
" }}}



" ############################################################
" 表示 {{{
" ############################################################
syntax enable   " シンタックスハイライトを有効化。

" '<C-g>'等によるファイル関連のメッセージ。
set shortmess+=I    " 起動時のメッセージを非表示。

set title           " ウィンドウのタイトルを表示。
" set titlestring=    " ウィンドウタイトル。

" set showtabline=2   " タブページのラベルを常に表示。
set showtabline=0   " タブページのラベルを表示しない。

set numberwidth=1       " 行番号を表示するのに使用される最小の桁数。
set number              " 行番号を表示。
set rulerformat=%l,%v   " ルーラーの内容。
set ruler               " ルーラーを表示。
set foldcolumn=3        " ウィンドウ端に表示する折り畳み用の列の幅。

" ステータス行と垂直分割の区切り文字。
set fillchars-=fold:-   " 'foldtext'の空白部分に文字を表示しない。

" 折り畳みの深さ
" set foldlevel=0 " 全ての折り畳みを閉じる。

" 折り畳みを閉じるコマンドの種類。
" set foldclose=all   " 折り畳み区間の外に出るときに自動的に折り畳みを閉じる。

set foldtext=FoldCCtext()   " 閉じられた折り畳み部分に表示するテキストの式。

" 折畳の種類。
set foldmethod=marker   " マーカーで折り畳みを指定。

" タブ文字や行末、空白文字等を可視化。
set list

" listモードと`:list`での表示に使用する文字。
if &encoding == 'utf-8'
    set listchars=eol:↲,tab:^\ ,trail:␣,extends:»,precedes:«,conceal:☨,nbsp:⌷
else
    set listchars=eol:\ ,tab:^\ ,trail:~,extends:>,precedes:<,conceal:+,nbsp:_
endif

" 全角スペースを可視化。
function! s:highlightZenkakuSpace()
    highlight ZenkakuSpace guifg=darkgrey gui=underline ctermfg=darkgrey cterm=underline
    silent! match ZenkakuSpace /　/
endfunction
autocmd vimrc_autocmd VimEnter,BufEnter * call s:highlightZenkakuSpace()

set breakat=\ \	!@*-+;:,./? " 'linebreak'が有効なときに行を折り返す文字。
set linebreak               " 'breakat'に指定された文字で長い行を折り返す。

" 折り返された行の先頭に表示する文字列。
if &encoding == 'utf-8'
    set showbreak=↪\ 
else
    set showbreak=>\ 
endif

" カーソル行のテキストをコンシール表示するモード。
set concealcursor=nc    " ノーマルモード、コマンドライン編集でコンシール表示。

" コンシール構文属性のテキストの表示方法。
" 構文アイテムに指定された代理文字を表示。
" 代理文字が指定されていないときは'listchars'の設定を使用。
set conceallevel=1

set nowrap  " ウィンドウの幅より長い行は一部のみを表示。

" 行頭・行末にあるときに前行・次行へ移動させるキー。
set whichwrap+=<,>,[,]  " ノーマル、ビジュアル、インサート、置換モードの'<Left>'、'<Right>'で前行・次行へ移動。

set nospell         " スペルチェックを無効化。
set spelllang=en_us " スペルチェックを行う単語リスト名のリスト。

" テキスト表示の方法。
set display=lastline    " ウィンドウの最後の行を可能な限り表示。

set cmdheight=2     " コマンドラインの行数。
set cmdwinheight=10 " コマンドライン/ウィンドウの行数。
set showcmd         " コマンドの一部を画面の最下行に表示。

" ウィンドウ下部にステータス行が表示される条件。
set laststatus=2    " ステータス行を常に表示。

" ステータスラインの表示内容。
set statusline=[%n]                                                             " バッファー番号。
set statusline+=%{fugitive#statusline()}                                        " Fugitive: Gitのブランチ。
set statusline+=\                                                               " スペース。
" set statusline+=%F                                                              " バッファー内のファイルのフルパス。
set statusline+=%t                                                              " バッファー内のファイルのファイル名。
set statusline+=\                                                               " スペース。
set statusline+=%m                                                              " 修正フラグ "[+]" "[-]"。
set statusline+=%r                                                              " 読み込み専用フラグ "[RO]"。
set statusline+=%h                                                              " ヘルプバッファーフラグ "[ヘルプ]"。
set statusline+=%w                                                              " プレビューウィンドウフラグ "[プレビュー]"。
set statusline+=%<                                                              " 行が長い場合に切り詰める位置。
set statusline+=%=                                                              " 左寄せ項目と右寄せ項目の区切り。
set statusline+=%#warningmsg#                                                   " Syntastic: 強調グループ。
set statusline+=%{SyntasticStatuslineFlag()}                                    " Syntastic: シンタックスエラーのフラグ。
set statusline+=%*                                                              " Syntastic: 強調グループの復元。
set statusline+=%y                                                              " バッファー内のファイルのタイプ "[vim]"。
set statusline+=[                                                               " 括弧(開き)。
set statusline+=%{&fenc!=''?&fenc:&enc}                                         " 文字エンコーディング。
set statusline+=%{(&bomb?'BOM':'')}                                             " BOM。
set statusline+=]                                                               " 括弧(閉じ)。
set statusline+=%{'['.&ff.']'}                                                  " ファイル形式。
if has('iconv')
    set statusline+=[0x%{FencB()}]                                              " 文字コード。
endif
set statusline+=\                                                               " スペース。
set statusline+=%p                                                              " 現在行がファイル内の何％の位置にあるか。
set statusline+=%%                                                              " パーセント。
set statusline+=/                                                               " スラッシュ。
set statusline+=%L                                                              " バッファー内の総行数。
set statusline+=\                                                               " スペース。
set statusline+=%l                                                              " 何行目にカーソルがあるか。
set statusline+=,                                                               " カンマ。
set statusline+=%v                                                              " 画面上の何列目にカーソルがあるか。

" カーソル位置の文字の文字コードを取得。
function! FencB()
    let c = matchstr(getline('.'), '.', col('.') - 1)
    let c = iconv(c, &enc, &fenc)
    return s:byte2hex(s:str2byte(c))
endfunction

" バイトを16進数文字列に変換。
function! s:byte2hex(bytes)
    return join(map(copy(a:bytes), 'printf("%02X", v:val)'), '')
endfunction

" 文字列をバイトリストに変換。
function! s:str2byte(str)
    return map(range(len(a:str)), 'char2nr(a:str[v:val])')
endfunction

" 挿入モードでステータスラインの色を変更。
" 挿入モードのステータスラインのハイライト。
let s:hi_insert = 'highlight StatusLine guifg=white guibg=#0087af gui=NONE ctermfg=white ctermbg=darkblue cterm=NONE'
" ステータスラインをハイライト。
function! s:highlightStatusLine(mode)
    if a:mode == 'Enter'
        silent! let s:command_hi_sl = 'highlight ' . s:getHighlight('StatusLine')
        execute 'silent! ' . s:hi_insert
    elseif exists('s:command_hi_sl')
        highlight clear StatusLine
        execute 'silent! ' . s:command_hi_sl
        redraw
    endif
endfunction
" ハイライトを取得。
function! s:getHighlight(group_name)
    redir => hi_sl
    execute 'silent! highlight ' . a:group_name
    redir END

    let hi_sl = substitute(hi_sl, '[\r\n]', '', 'g')
    let hi_sl = substitute(hi_sl, 'xxx', '', '')

    return hi_sl
endfunction
augroup vimrc_autocmd
    autocmd InsertEnter * call s:highlightStatusLine('Enter')
    autocmd InsertLeave * call s:highlightStatusLine('Leave')
augroup END

set splitbelow  " ウィンドウの横分割で新しいウィンドウ下に開く。
set splitright  " ウィンドウの縦分割で新しいウィンドウ右に開く。

" カレントウィンドウを常に最大化。
" augroup vimrc_autocmd
"     " カレントウィンドウの列数の最小値。
    " autocmd WinEnter * set winwidth=999
"
"     " カレントウィンドウの行数の最小値。
    " autocmd WinEnter * set winheight=999
" augroup END

" set winminwidth=0       " カレントウィンドウ以外のウィンドウの幅の最小値。
" set winminheight=0      " カレントウィンドウ以外のウィンドウの高さの最小値。
" set winfixwidth         " 'equalalways'を有効にしてウィンドウを開閉したときにウィンドウの幅を保つ。
" set winfixheight        " 'equalalways'を有効にしてウィンドウを開閉したときにウィンドウの高さを保つ。
" set previewheight=12    " プレビューウィンドウの高さの既定値。
" set helpheight=20       " ヘルプウィンドウの高さの最小値。
set noequalalways       " ウィンドウを分割したり閉じたときにウィンドウのサイズを変化させない。

set sidescroll=1    " 水平スクロールの刻み値。

" カーソルの上または下に表示する最小の行数。
set scrolloff=999   " カーソル行を常にウィンドウの中央に表示。

" カーソルの右または左に表示する最小の行数。
set sidescrolloff=999   " カーソル列を常にウィンドウの中央に表示。

set colorcolumn=80,120  " 強調表示する列。
set cursorline          " カーソル行を強調。
set cursorcolumn        " カーソル桁を強調。

" カーソル行とカーソル桁の強調用の自動コマンドグループ。
augroup vimrc_highlightCursor
    autocmd!
augroup END

" カレントウィンドウに対してのみカーソル行とカーソル桁を強調。
function! s:highlightCursor()
    autocmd vimrc_highlightCursor WinLeave * set nocursorline
    autocmd vimrc_highlightCursor WinLeave * set nocursorcolumn
    autocmd vimrc_highlightCursor WinEnter * set cursorline
    autocmd vimrc_highlightCursor WinEnter * set cursorcolumn
endfunction
call s:highlightCursor()

" マクロやレジスターの内容、キーボード入力のないコマンドの実行時に画面を再描画しない。
" ウィンドウタイトルの更新も後回しにする。
set lazyredraw
" }}}



" ############################################################
" 編集 {{{
" ############################################################
set expandtab       " '<Tab>'の代わりに空白を使用。
set tabstop=4       " ファイル内の'<Tab>'に対応する空白の数。
set softtabstop=4   " '<Tab>'の挿入や'<BS>'の使用等の編集時に<Tab>が対応する空白の数。

" 行頭の余白で'<Tab>'で'shiftwidth'分の空白を挿入。
" 他の場所では'tabstop'または'softtabstop'分の空白を挿入。
" '<BS>'で行頭の'shiftwidth'分の空白を削除。
set smarttab

" 自動整形の実行方法。
" マルチバイト文字の間でも改行する。
" 行の連結時にマルチバイト文字の前後に空白を挿入しない。
set formatoptions+=mM
set formatoptions-=tc   " 'textwidth'によるテキストの自動折り返しを行わない。

set shiftwidth=4    " 自動インデントに使用される空白の数。
set shiftround      " インデントを'shiftwidth'の倍数に丸める。
" set preserveindent  " インデントの変更時に可能な限りインデントの構造を保つ。
set autoindent      " 新しい行のインデントを現在行と同じにする。
" set smartindent     " 新しい行の作成時に高度な自動インデントを行う。

" クリップボードの挙動。
set clipboard-=autoselect               " 選択範囲をクリップボード用レジスターへコピーしない。
set clipboard-=exclude:cons\\\|linux    " コンソールでXサーバーと通信を行う。
set clipboard+=unnamed                  " コピー、削除、変更、ペースト等にクリップボード用レジスターを使用。
set clipboard+=unnamedplus              " ヤンク以外の操作で'+'レジスターを使用。ヤンクで'+'レジスターへコピー。

" set textwidth=80  " 入力テキストの最大幅。

" 挿入モードでバックスペースが働く対象。
set backspace=indent,eol,start  " autoindent、改行、挿入区間を超えてバックスペースを働かせる。

set matchpairs+=<:> " 片方からもう片方へジャンプする括弧等の組を構成する文字。
set matchtime=1     " マッチしている括弧を表示する時間(0.1秒単位)。
set showmatch       " 閉じ括弧等の入力時に対応する開き括弧等に一瞬ジャンプする。

" set cpoptions+=n    " 折り返された行のテキスト表示に行番号表示の列も使用。

" バッファーが放棄されるときにhidden状態にする。
" バッファーが放棄されるときに警告を表示させない。
set hidden

set cdpath+=$HOME   " `:cd`や`:lcd`を使用したときに検索されるディレクトリのリスト。

set timeout             " マッピングとキーコードにタイムアウトを設ける。
set ttimeout            " キーコードにタイムアウトを設ける。
set timeoutlen=3000     " マッピングされたキー列が完了するのを待つ時間(ミリ秒単位)。
set ttimeoutlen=100     " キーコードが完了するのを待つ時間(ミリ秒単位)。

" タグの検索時に二分探索を使用しない。
" Vim 7.3.336未満で日本語ヘルプの検索でフリーズする問題への対策。
if v:version < 703 || (v:version == 703 && !has('patch336'))
    set notagbsearch
endif

" 仮想編集の設定。
set virtualedit+=block  " Visual blockモードで仮想編集を有効化。

set keywordprg=:help    " カーソル位置のキーワードを調べるためのプログラム。

" `w`、`*`、`[i`等のコマンドやパターン内の"\k"でキーワードとして認識する文字。
" set iskeyword-=@
" set iskeyword+=a-z,A-Z,_,.,-,>

set nostartofline   " コマンドでの移動時にカーソルを行内の最初の非空白文字に移動しない。

" テキスト内の数を増減させるコマンドで認識させる文字の種類。
set nrformats-=octal    " '0'で始まる8進数の認識を無効化。

" set tildeop " `~`をオペレーターのように使用。

set wildignorecase  " ファイル名やディレクトリの補完時に大文字と小文字を区別しない。

" 補完モード。
" 1回目の'wildchar'で共通する最長の文字列までを補完し、'wildmenu'を開始。
" 2回目の'wildchar'で次のマッチを完全に補完する。
set wildmode=longest:full,full

set wildmenu    " コマンドライン補完で拡張モードを有効化。

set history=1000    " `:`によるコマンドと検索パターンの履歴数。

" 変更された行数、置換の回数が報告される最小値。
set report=0    " 変更・置換が行われた場合は必ず報告する。

set completeopt=menuone " 候補が1つしかないときもポップアップメニューで補完候補を表示。

" キーワード補完の方法とキーワード検索の対象となる場所。
set complete=.  " カレントバッファからのみ検索。

" set pumheight=20    " 挿入モード補完のポップアップメニューに表示される項目数の最大値。

" ファイルを開いた後に前回のカーソル位置へ移動。
" 全ての折り畳みを開く。
autocmd vimrc_autocmd BufReadPost *
            \ if line("\'\"") > 1 && line("'\"") <= line('$') |
                \ execute 'normal! g`"' |
                \ execute 'normal! zR' |
            \ endif
" }}}



" ############################################################
" 検索・置換 {{{
" ############################################################
set ignorecase  " 検索パターンの大文字と小文字を区別しない。
set smartcase   " 検索パターンに大文字を含む場合は 'ignorecase' を無効化。
set incsearch   " 検索コマンドの入力中にマッチするテキストを表示。
set hlsearch    " 検索パターンにマッチするテキストを全て強調表示。
set nowrapscan  " 検索がファイルの末尾まで進んだとき、ファイルの先頭から再検索しない。

" `:grep`で使用するプログラム。
" set grepprg=internal    " `:grep`を`:vimgrep`と同様にする。

" QuickFixウィンドウを自動的に開く。
autocmd vimrc_autocmd QuickfixCmdPost make,grep,grepadd,vimgrep,vimgrepadd,cscope
            \ if len(getqflist()) != 0 | copen | endif

" ロケーションリストを自動的に開く。
autocmd vimrc_autocmd QuickfixCmdPost lmake,lgrep,lgrepadd,lvimgrep,lvimgrepadd,lcscope
            \ if len(getloclist(0)) != 0 | lopen | endif
" }}}



" ############################################################
" キーマッピング {{{
" ############################################################
" マップリーダー。
let g:mapleader      = '\'  " マップリーダー。
let g:maplocalleader = '_'  " マップローカルリーダー。

" " マップリーダー。
" noremap [-leader-] <Nop>
" map     <Leader>   [-leader-]

" " マップローカルリーダー。
" noremap [-local-]     <Nop>
" map     <LocalLeader> [-local-]

" Exコマンドのショートカット用マップリーダー。
noremap [-ex-] <Nop>
map     ;      [-ex-]

" オペレーター用マップリーダー。
noremap [-op-] <Nop>
map     ,      [-op-]

" オプションの変更用マップリーダー。
noremap [-option-] <Nop>
map     <Space>    [-option-]

" `f`、`t`、`F`、`T`を繰り返し。
noremap <silent> [-ex-]; ;
noremap <silent> [-op-], ,

" `j`、`k`で表示行に移動。
nnoremap <silent> <Down> gj
nnoremap <silent> <Up>   gk
nnoremap <silent> j      gj
nnoremap <silent> k      gk

" ノーマルモードでのみ`h`・`l`で行頭・行末を超える('whichwrap')。
nnoremap <silent> h <Left>
nnoremap <silent> l <Right>

" スムーススクロール。
let g:scroll_factor         = 5000  " スクロールの速度(ウェイト)。
let g:scroll_skip_line_size = 1     " 一度にスクロールする行数。
" 'dir'方向へウィンドウの高さ÷'windiv行分、'g:scroll_factor'×'factor'の速度でスムーススクロール。
function! s:smoothScroll(dir, windiv, factor)
    let wh = winheight(0)
    let i = 0
    let j = 0
    while i < wh / a:windiv
        let t1 = reltime()
        let i = i + 1
        if a:dir == 'd'
            if line('w$') == line('$')
                break
            endif
            execute "normal \<C-e>j"
        else
            if line('w0') == 1
                break
            endif
            execute "normal \<C-y>k"
        end

        if j >= g:scroll_skip_line_size
            let j = 0
            redraw
            while 1
                let t2 = reltime(t1, reltime())
                if t2[1] > g:scroll_factor * a:factor
                    break
                endif
            endwhile
        else
            let j = j + 1
        endif
    endwhile
endfunction
noremap <silent> <C-d>      :<C-u>call <SID>smoothScroll('d', 4, 1)<CR>
noremap <silent> <C-u>      :<C-u>call <SID>smoothScroll('u', 4, 1)<CR>
noremap <silent> <C-f>      :<C-u>call <SID>smoothScroll('d', 2, 2)<CR>
noremap <silent> <C-b>      :<C-u>call <SID>smoothScroll('u', 2, 2)<CR>
noremap <silent> <PageDown> :<C-u>call <SID>smoothScroll('d', 2, 2)<CR>
noremap <silent> <PageUp>   :<C-u>call <SID>smoothScroll('u', 2, 2)<CR>

" `x`、`X`で文字を消去専用レジスタに入れて削除。
nnoremap <silent> x "_x
nnoremap <silent> X "_X

" 'virtualedit=all'のときにテキストの末尾にペースト。
if has('virtualedit') && &virtualedit =~# '\<all\>'
    nnoremap <silent><expr> p (col('.') >= col('$') ? '$' : '') . 'p'
endif

" カーソル行の上・下に新しい行を作成。
nnoremap <silent> go o<Esc>
nnoremap <silent> gO O<Esc>

" '変更点があれば書き込み、Vimを終了する'を無効化。
nnoremap <silent> ZZ <Nop>

" カーソル行以外の全ての折り畳みを閉じる。
nnoremap <silent> zi zMzv

" 検索ハイライトを無効化。
nnoremap <silent> <Esc><Esc> :<C-u>nohlsearch<CR>

" バッファー。
nnoremap <silent> [-ex-]bn :<C-u>bnext<CR>
nnoremap <silent> [-ex-]bp :<C-u>bprevious<CR>
nnoremap <silent> [-ex-]bd :<C-u>bdelete<CR>
nnoremap <silent> [-ex-]bf :<C-u>bfirst<CR>
nnoremap <silent> [-ex-]bl :<C-u>blast<CR>

" ウィンドウ。
nnoremap <silent> <Leader>w  <C-w>

" タブ。
nnoremap <silent> [-ex-]te :<C-u>tabedit<CR>
nnoremap <silent> [-ex-]tn :<C-u>tabnext<CR>
nnoremap <silent> [-ex-]tp :<C-u>tabprevious<CR>
nnoremap <silent> [-ex-]tf :<C-u>tabfirst<CR>
nnoremap <silent> [-ex-]tl :<C-u>tablast<CR>
nnoremap <silent> [-ex-]tc :<C-u>tabclose<CR>
nnoremap <silent> [-ex-]to :<C-u>tabonly<CR>
nnoremap <silent> [-ex-]ts :<C-u>tabs<CR>

" タグ。
nnoremap <silent> <C-]>]     g<C-]>
nnoremap <silent> <C-]><C-]> <C-]>
nnoremap <silent> <C-]>[     <C-t>
nnoremap <silent> <C-]><C-[> <C-t>
nnoremap <silent> <C-]><     <C-t>
nnoremap <silent> <C-]>>     :<C-u>tag<CR>
nnoremap <silent> <C-]>n     :<C-u>tnext<CR>
nnoremap <silent> <C-]>p     :<C-u>tprevious<CR>
nnoremap <silent> <C-]>N     :<C-u>tNext<CR>
nnoremap <silent> <C-]>r     :<C-u>trewind<CR>
nnoremap <silent> <C-]>f     :<C-u>tfirst<CR>
nnoremap <silent> <C-]>l     :<C-u>tlast<CR>

" 折り畳み
nnoremap <silent> z[ [z
nnoremap <silent> z] ]z


" QuickFixリスト。
nnoremap <silent> [-ex-]cn  :<C-u>cnext<CR>
nnoremap <silent> [-ex-]cp  :<C-u>cprevious<CR>
nnoremap <silent> [-ex-]cln :<C-u>cnewer<CR>
nnoremap <silent> [-ex-]clp :<C-u>colder<CR>
nnoremap <silent> [-ex-]cgg :<C-u>cfirst<CR>
nnoremap <silent> [-ex-]cG  :<C-u>clast<CR>
nnoremap <silent> [-ex-]cfn :<C-u>cnfile<CR>
nnoremap <silent> [-ex-]cfp :<C-u>cpfile<CR>
nnoremap <silent> [-ex-]co  :<C-u>copen<CR>
nnoremap <silent> [-ex-]cc  :<C-u>cclose<CR>
nnoremap <silent> [-ex-]cw  :<C-u>cwindow<CR>

" ロケーションリスト。
nnoremap <silent> [-ex-]ln  :<C-u>lnext<CR>
nnoremap <silent> [-ex-]lp  :<C-u>lprevious<CR>
nnoremap <silent> [-ex-]lln :<C-u>lnewer<CR>
nnoremap <silent> [-ex-]llp :<C-u>lolder<CR>
nnoremap <silent> [-ex-]lgg :<C-u>lfirst<CR>
nnoremap <silent> [-ex-]lG  :<C-u>llast<CR>
nnoremap <silent> [-ex-]lfn :<C-u>lnfile<CR>
nnoremap <silent> [-ex-]lfp :<C-u>lpfile<CR>
nnoremap <silent> [-ex-]lo  :<C-u>lopen<CR>
nnoremap <silent> [-ex-]lc  :<C-u>lclose<CR>
nnoremap <silent> [-ex-]lw  :<C-u>lwindow<CR>

" コンパイル。
nnoremap <silent> [-ex-]mak  :<C-u>make<CR>
nnoremap <silent> [-ex-]mk   :<C-u>make<CR>
nnoremap <silent> [-ex-]lmak :<C-u>lmake<CR>
nnoremap <silent> [-ex-]lmk  :<C-u>lmake<CR>

" 差分モード。
nnoremap <silent> d< do
nnoremap <silent> d> dp

" grep。
" TODO、FIXME、XXXを検索。
nnoremap <silent> [-ex-]gt :<C-u>vimgrep /\<todo\>\\|\<fixme\>\\|\<xxx\>\c/j %<CR>

" Exコマンドを現在のファイルから読み込み。
nnoremap <silent> [-ex-]% :<C-u>source %<CR>

" 画面を再描画。
nnoremap <silent> [-ex-]redr :<C-u>redraw!<CR>

" 検索ハイライトをトグル。
nnoremap <silent> [-option-]h :<C-u>call <SID>toggleOption('hlsearch')<CR>

" 折り返しをトグル。
nnoremap <silent> [-option-]w :<C-u>call <SID>toggleOption('wrap')<CR>

" listモードをトグル。
nnoremap <silent> [-option-]l :<C-u>call <SID>toggleOption('list')<CR>

" スペルチェックをトグル。
nnoremap <silent> [-option-]s :<C-u>call <SID>toggleOption('spell')<CR>

" カーソル行とカーソル桁の強調をトグル。
function! s:toggleCursor()
    if &cursorline || &cursorcolumn
        augroup vimrc_highlightCursor
            autocmd!
        augroup END
        set nocursorline
        set nocursorcolumn
        echo '[nocursorline][nocursorcolumn]'
    else
        call s:highlightCursor()
        set cursorline
        set cursorcolumn
        echo '[cursorline][cursorcolumn]'
    endif
endfunction
nnoremap <silent> [-option-]c :<C-u>call <SID>toggleCursor()<CR>

" カラー端末の背景色の有無をトグル。
if !s:is_gui
    function! s:toggleBackground()
        if synIDattr(synIDtrans(hlID('Normal')), 'bg') != -1
            execute 'silent! highlight Normal ctermbg=NONE'
        else
            execute 'silent! highlight Normal ctermbg=' . s:hi_normal_bg
        endif
    endfunction

    autocmd vimrc_autocmd VimEnter,ColorScheme *
                \ let s:hi_normal_bg = synIDattr(synIDtrans(hlID('Normal')), 'bg')

    nnoremap <silent> [-option-]b :<C-u>call <SID>toggleBackground()<CR>
endif

" バッファーローカルな'shiftwidth'をグローバルな値に変更。
function! s:enableGlobalShiftwidth()
    let b:_global_shiftwidth_shiftwidth = &l:shiftwidth
    let &l:shiftwidth = &g:shiftwidth
endfunction
" グローバルな値に変更したバッファーローカルな'shiftwidth'を元に戻す。
function! s:disableGlobalShiftwidth()
    let &l:shiftwidth = b:_global_shiftwidth_shiftwidth
endfunction
" 行をグローバルな'shiftwidth'分ずらす。
nnoremap <silent> g>> :<C-u>call <SID>enableGlobalShiftwidth()<CR>>>:<C-u>call <SID>disableGlobalShiftwidth()<CR>
nnoremap <silent> g<< :<C-u>call <SID>enableGlobalShiftwidth()<CR>>>:<C-u>call <SID>disableGlobalShiftwidth()<CR>
vnoremap <silent> g> :<C-u>call <SID>enableGlobalShiftwidth()<CR>:<C-u>'<,'>><CR>:<C-u>call <SID>disableGlobalShiftwidth()<CR>
vnoremap <silent> g< :<C-u>call <SID>enableGlobalShiftwidth()<CR>:<C-u>'<,'><<CR>:<C-u>call <SID>disableGlobalShiftwidth()<CR>

" 挿入モードで行を'shiftwidth'分ずらす。
" 通常の`<C-o>>>`、`<C-o><<`が遅いため上書き。
inoremap <silent> <C-o>>>  <C-t>
inoremap <silent> <C-o><<  <C-d>
inoremap <silent> <C-o>g>> <C-o>:<C-u>call <SID>enableGlobalShiftwidth()<CR><C-t><C-o>:<C-u>call <SID>disableGlobalShiftwidth()<CR>
inoremap <silent> <C-o>g<< <C-o>:<C-u>call <SID>enableGlobalShiftwidth()<CR><C-d><C-o>:<C-u>call <SID>disableGlobalShiftwidth()<CR>

" 挿入モード補完のポップアップメニューが表示されているときは候補を選択。
" ポップアップメニューが表示されていないときは'<Tab>'を挿入。
inoremap <silent><expr> <Tab> pumvisible() ? '<C-n>' : '<Tab>'

" 挿入モード補完のポップアップメニューが表示されているときは候補を選択。
" ポップアップメニューが表示せず、補完対象の文字列も存在しないときは'<Tab>'を挿入。
" 補完対象の文字列が存在していて、オムニ関数が存在しないときはカーソルの直前と同じ文字で始まる単語の候補を検索。
" オムニ関数が存在するときはオムニ補完。
" function! s:smartTab()
    " if pumvisible()
        " return "\<C-n>"
    " endif

    " let col = col('.') - 1

    " if !col || getline('.')[col - 1] !~ '\k\|<\|/'
        " return "\<tab>"
    " elseif exists('&omnifunc') && &omnifunc == ''
        " return "\<C-n>"
    " else
        " return "\<C-x>\<C-o>"
    " endif
" endfunction
" inoremap <silent> <Tab> <C-r>=<SID>smartTab()<CR>

" HTMLやXHTML、XMLなどのタグを閉じる。
" タグを閉じるために設定を変更。
function! s:enableCloseTag()
  let b:close_tag_ofu = &l:omnifunc
  let b:close_tag_isk = &l:iskeyword

  setlocal omnifunc=htmlcomplete#CompleteTags
  setlocal iskeyword+=:

  return ''
endfunction
" タグを閉じるために変更した設定を元に戻す。
function! s:disableCloseTag()
    if exists('b:close_tag_ofu')
        let &l:omnifunc = b:close_tag_ofu
        unlet b:close_tag_ofu
    endif
    if exists('b:close_tag_isk')
        let &l:isk = b:close_tag_isk
        unlet b:close_tag_isk
    endif

    return ''
endfunction
" '<C-_>.'にタグを閉じる機能を割り当て。
function! s:mapCloseTag()
    if exists('&omnifunc')
        inoremap <silent><buffer> <C-_>. </<C-r>=<SID>enableCloseTag()<CR><C-x><C-o><C-r>=<SID>disableCloseTag()<CR>
        if exists(':XMLns')
            XMLns xhtml10s
        endif
    else
        inoremap <silent><buffer> <C-_>. </><Left>
    endif
endfunction
autocmd vimrc_autocmd FileType *html*,xml call s:mapCloseTag()
" }}}



" ############################################################
" プラグインの設定 {{{
" ############################################################
" **************************************************
" MatchParen {{{
" **************************************************
let g:loaded_matchparen = 1 " 対応する括弧を強調表示しない。
" }}}

" **************************************************
" Kwbd {{{
" **************************************************
" ウィンドウを残したままバッファーを閉じる。
nnoremap <silent> [-ex-]bc :<C-u>Kwbd<CR>
" }}}

" **************************************************
" NeoComplCache {{{
" **************************************************
let g:neocomplcache_enable_at_startup              = 1                              " Vimの起動時に有効化。
" let g:neocomplcache_enable_auto_select             = 1                              " 自動的に一番上の候補を選択。
" let g:neocomplcache_enable_camel_case_completion   = 1                              " 大文字を単語の区切りとしてあいまい検索。
" let g:neocomplcache_enable_underbar_completion     = 1                              " '_'を単語の区切りとしてあいまい検索。
let g:neocomplcache_enable_smart_case              = 1                              " 入力に大文字が含まれているときは大文字・小文字を区別。
let g:neocomplcache_auto_completion_start_length   = 4                              " キー入力時にキーワード補完を行う入力数。
" let g:neocomplcache_manual_completion_start_length = 0                              " 手動補完時にキーワード補完を行う入力数。
" let g:neocomplcache_min_keyword_length             = 4                              " バッファーや辞書ファイル中で補完の対象となるキーワードの最小の長さ。
" let g:neocomplcache_min_syntax_length              = 4                              " シンタックスファイル中で補完の対象となるキーワードの最小の長さ。
" let g:neocomplcache_caching_limit_file_size        = 500000                         " ファイルをキャッシュするファイルサイズ。
let g:neocomplcache_enable_prefetch                = 1                              " プリフェッチを有効化。
let g:neocomplcache_snippets_dir                   = expand('$HOME/.vim/snippets')  " スニペット補完ファイルへのパス。

" オムニ補完するためのキーワードパターン。
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.php  = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c    = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp  = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'

" カーソル位置のスニペットを展開。
" スニペットが存在しないときは次のプレースホルダーへジャンプ。
imap <silent> <C-k> <Plug>(neocomplcache_snippets_expand)

" " ポップアップメニューが表示されているときは候補を選択。
" " ポップアップメニューが表示されていないときはカーソル位置のスニペットを展開。
" " スニペットが存在しないときは次のプレースホルダーへジャンプ。
" " プレイースホルダーが存在しないときは'<Tab>'を挿入。
" imap <silent><expr> <Tab> pumvisible() ? '<C-n>' : neocomplcache#sources#snippets_complete#expandable() ? '<Plug>(neocomplcache_snippets_expand)' : '<Tab>'

" 補完を選択してポップアップメニューを閉じる。
inoremap <silent><expr> <C-y> neocomplcache#close_popup()
" ポップアップメニューが表示されていないときは'<CR>'を挿入。
inoremap <silent><expr> <CR>  pumvisible() ? neocomplcache#close_popup() : '<CR>'

" 補完をキャンセルしてポップアップメニューを閉じる。
inoremap <silent><expr> <C-e> neocomplcache#cancel_popup()
" ポップアップメニューを閉じてカーソルの前の文字を削除。
inoremap <silent><expr> <C-h> neocomplcache#smart_close_popup() . '<C-h>'
inoremap <silent><expr> <BS>  neocomplcache#smart_close_popup() . '<BS>'

" 補完した候補を元に戻す。
inoremap <silent><expr> <C-u> neocomplcache#undo_completion()

" 補完候補の共通文字列を補完。
inoremap <silent><expr> <C-l> neocomplcache#complete_common_string()

" スニペット補完ファイルを編集。
nnoremap <silent> <Leader>ns :NeoComplCacheEditSnippets<CR>
" }}}

" **************************************************
" Savevers {{{
" **************************************************
let savevers_dirs = &backupdir  " パッチモードファイルを保存するディレクトリ。

" 現在のファイルを前のバージョンと比較。
nnoremap <silent> <Leader>vd :<C-u>VersDiff<CR>

" 現在のVersDiffウィンドウの前のバージョンを開く。
nnoremap <silent> <Leader>v- :<C-u>VersDiff -<CR>

" 現在のVersDiffウィンドウの次のバージョンを開く。
nnoremap <silent> <Leader>v+ :<C-u>VersDiff +<CR>

" VersDiffウィンドウを閉じる。
nnoremap <silent> <Leader>vc :<C-u>VersDiff -c<CR>
" }}}

" **************************************************
" Submode {{{
" **************************************************
" ウィンドウコマンドモード。
call submode#enter_with('Window', 'n', 's', '<Leader>ww', '<C-w>w<C-w>w')   " サブモードに入る。
call submode#enter_with('Window', 'n', 's', '<Leader>w+', '<C-w>+')         " サブモードに入る(ウィンドウの高さを高くする)。
call submode#enter_with('Window', 'n', 's', '<Leader>w-', '<C-w>-')         " サブモードに入る(ウィンドウの高さを低くする)。
call submode#enter_with('Window', 'n', 's', '<Leader>w<', '<C-w><')         " サブモードに入る(ウィンドウの幅を狭める)。
call submode#enter_with('Window', 'n', 's', '<Leader>w>', '<C-w>>')         " サブモードに入る(ウィンドウの幅を広げる)。
call submode#leave_with('Window', 'n', 's', '<Esc>')                        " サブモードから抜ける。
" ウィンドウのサイズを変更。
call submode#map('Window', 'n', 's', '+', '<C-w>+')
call submode#map('Window', 'n', 's', '-', '<C-w>-')
call submode#map('Window', 'n', 's', '<', '<C-w><')
call submode#map('Window', 'n', 's', '=', '<C-w>=')
call submode#map('Window', 'n', 's', '>', '<C-w>>')
call submode#map('Window', 'n', 's', '_', '<C-w>_')
" ウィンドウを開く・閉じる。
call submode#map('Window', 'n', 's', 'n', '<C-w>n')
call submode#map('Window', 'n', 's', '^', '<C-w>^')
call submode#map('Window', 'n', 's', 's', '<C-w>s')
call submode#map('Window', 'n', 's', 'S', '<C-w>S')
call submode#map('Window', 'n', 's', 'v', '<C-w>v')
call submode#map('Window', 'n', 's', 'c', '<C-w>c')
call submode#map('Window', 'n', 's', 'o', '<C-w>o')
call submode#map('Window', 'n', 's', 'q', '<C-w>q')
call submode#map('Window', 'n', 's', 'z', '<C-w>z')
" ウィンドウへ移動。
call submode#map('Window', 'n', 's', 'h',       '<C-w>h')
call submode#map('Window', 'n', 's', '<Left>',  '<C-w><Left>')
call submode#map('Window', 'n', 's', 'j',       '<C-w>j')
call submode#map('Window', 'n', 's', '<Down>',  '<C-w><Down>')
call submode#map('Window', 'n', 's', 'k',       '<C-w>k')
call submode#map('Window', 'n', 's', '<Up>',    '<C-w><Up>')
call submode#map('Window', 'n', 's', 'l',       '<C-w>l')
call submode#map('Window', 'n', 's', '<Right>', '<C-w><Right>')
call submode#map('Window', 'n', 's', 'b',       '<C-w>b')
call submode#map('Window', 'n', 's', 't',       '<C-w>t')
call submode#map('Window', 'n', 's', 'w',       '<C-w>w')
call submode#map('Window', 'n', 's', 'W',       '<C-w>W')
call submode#map('Window', 'n', 's', 'p',       '<C-w>p')
call submode#map('Window', 'n', 's', 'P',       '<C-w>P')
" ウィンドウを入れ替え。
call submode#map('Window', 'n', 's', 'H', '<C-w>H')
call submode#map('Window', 'n', 's', 'J', '<C-w>J')
call submode#map('Window', 'n', 's', 'K', '<C-w>K')
call submode#map('Window', 'n', 's', 'L', '<C-w>L')
call submode#map('Window', 'n', 's', 'T', '<C-w>T')
call submode#map('Window', 'n', 's', 'r', '<C-w>r')
call submode#map('Window', 'n', 's', 'R', '<C-w>R')
call submode#map('Window', 'n', 's', 'x', '<C-w>x')

" YankRingモード。
" サブモードに入る(カーソルの後に貼り付け)。
call submode#enter_with('YankRing', 'n', 's', '<Leader>p', 'p')
call submode#enter_with('YankRing', 'v', 's', '<Leader>p', 'p')
" サブモードに入る(カーソルの前に貼り付け)。
call submode#enter_with('YankRing', 'n', 's', '<Leader>P', 'P')
call submode#enter_with('YankRing', 'v', 's', '<Leader>P', 'P')
" サブモードから抜ける。
call submode#leave_with('YankRing', 'n', 's', '<Esc>')
" 前のヤンクテキストに置換。
call submode#map('YankRing', 'n', 's', 'p', ":<C-u>YRReplace '-1', 'P'<CR>")
call submode#map('YankRing', 'n', 's', '<', ":<C-u>YRReplace '-1', 'P'<CR>")
" 次のヤンクテキストに置換。
call submode#map('YankRing', 'n', 's', 'n', ":<C-u>YRReplace '1', 'p'<CR>")
call submode#map('YankRing', 'n', 's', '>', ":<C-u>YRReplace '1', 'p'<CR>")
" 貼り付けを取り消し。
call submode#map('YankRing', 'n', 's', 'u', "u<Plug>(submode-leave:'YankRing')")
" 貼り付けを取り消してYankRingバッファーを表示。
call submode#map('YankRing', 'n', 's', 'h', "u:<C-u>YRShow<CR><Plug>(submode-leave:'YankRing')")
" }}}

" **************************************************
" YankRing {{{
" **************************************************
let g:yankring_min_element_length = 2   " YankRingへ追加する最小の文字数。
" }}}

" **************************************************
" DelimitMate {{{
" **************************************************
let g:delimitMate_matchpairs = &matchpairs  " 組を構成する文字。

" 組を構成する文字にマルチバイトを追加。
let g:delimitMate_matchpairs .= ',”:”,’:’,｀:｀,（:）,［:］,｛:｝,＜:＞,「:」,『:』,【:】,〈:〉,《:》,〔:〕,〘:〙,〚:〛'

" let g:delimitMate_quotes             = "\" ' ` *"   " DelimitMateで使用する引用符。
" let g:delimitMate_nesting_quotes     = []           " 内容が空のときにも入れ子にする引用符。
let g:delimitMate_expand_cr          = 1            " 文字の組の中での'<Space>'を左右に展開。
let g:delimitMate_expand_space       = 1            " 文字の組の中での'<CR>'を上下に展開。
let g:delimitMate_balance_matchpairs = 1            " 閉じる文字の数に合わせて文字の組を調整。
" let g:delimitMate_excluded_regions   = 'Comments'   " 除外する範囲。
" let g:delimitMate_excluded_ft        = 'mail,txt'   " 除外するファイルタイプ。
" }}}

" **************************************************
" CSApprox {{{
" **************************************************
" let g:CSApprox_use_showrgb = 1  " システムのRGBデータベースを使用。

" " Molokai用のフック。
" let g:CSApprox_hook_molokai_post = [
                " \ 'highlight FoldColumn   ctermfg= 67',
                " \ 'highlight Folded       ctermfg= 67',
                " \ 'highlight VisualNOS    ctermfg=252 ctermbg=29',
                " \ 'highlight Visual       ctermfg=252 ctermbg=23',
                " \ 'highlight CursorLine   ctermbg=235',
                " \ 'highlight CursorColumn ctermbg=235',
                " \ 'highlight LineNr       ctermfg=250'
            " \ ]

" " GUI版以外はCSApproxを読み込み。
" if !s:is_gui
    " " Vimの起動後、カラースキームの読み込み後にハイライトを更新。
    " autocmd vimrc_autocmd VimEnter,ColorScheme *        CSApprox!
    " " .vimrcの書き込み後にハイライトを更新。
    " autocmd vimrc_autocmd BufWritePost         $MYVIMRC CSApprox!
" else
    " let g:CSApprox_loaded = 1
" endif
" }}}

" **************************************************
" Gundo {{{
" **************************************************
let g:gundo_width          = 31 " グラフとプレビューの幅。
let g:gundo_preview_bottom = 1  " プレビューウィンドウをカレントウィンドウの下に表示。

" Gundoを表示をトグル。
nnoremap <silent> <Leader>gu :<C-u>GundoToggle<CR>
" }}}

" **************************************************
" Netrw {{{
" **************************************************
let g:netrw_liststyle = 3   " ファイル一覧をツリー表示。
" }}}

" **************************************************
" VimFiler {{{
" **************************************************
let g:vimfiler_as_default_explorer     = 1             " Netrwの代わりにVimFilerを使用。
" let g:vimfiler_split_rule              = 'rightbelow'  " ウィンドウを右・下に開く。
" let g:vimfiler_safe_mode_by_default    = 0             " セーフモードを無効化。
let g:vimfiler_tree_leaf_icon          = ' '           " ツリーの枝のアイコン。
let g:vimfiler_tree_readonly_file_icon = '-'           " 読込専用ファイルのアイコン。

if &encoding == 'utf-8'
    let g:vimfiler_tree_opened_icon = '▾'   " 開かれたディレクトリツリーのアイコン。
    let g:vimfiler_tree_closed_icon = '▸'   " 閉じられたディレクトリツリーのアイコン。
else
    let g:vimfiler_tree_opened_icon = '-'   " 開かれたディレクトリツリーのアイコン。
    let g:vimfiler_tree_closed_icon = '+'   " 閉じられたディレクトリツリーのアイコン。
endif

let g:vimfiler_file_icon        = ' '   " ファイルのアイコン。
let g:vimfiler_marked_file_icon = '*'   " マークされたファイルのアイコン。

if s:is_win
    let g:unite_kind_file_use_trashbox = 1  " ファイルの削除にゴミ箱を使用。
elseif executable('trash')  " 可能であればファイル・ディレクトリの削除に`trash`を使用。
    let g:unite_kind_file_delete_file_command      = 'trash $srcs'
    let g:unite_kind_file_delete_directory_command = 'trash $srcs'
endif

" VimFilerをトグル。
nnoremap <silent> <Leader>f :<C-u>VimFiler -buffer-name=vimfiler -no-quit -winwidth=31 -toggle -split<CR>

" `p`で親ディレクトリへ移動。
autocmd vimrc_autocmd FileType vimfiler
            \ nmap <silent><buffer> p <Plug>(vimfiler_switch_to_parent_directory)
" }}}

" **************************************************
" NERD tree {{{
" **************************************************
let g:NERDTreeHijackNetrw = 0   " Netrwの代わりにNERD treeを使用しない。
let g:NERDTreeMinimalUI   = 1   " ブックマークラベルとヘルプテキストを非表示。
let g:NERDTreeDirArrows   = 1   " ディレクトリノードの表示に矢印を使用。

" " NERD treeの表示をトグル。
" nnoremap <silent> <Leader>f :<C-u>NERDTreeToggle<CR>

" " NERD treeを開く(再描画用)。
" nnoremap <silent> <Leader>F :<C-u>NERDTree<CR>

" NERD treeの表示をトグル。
nnoremap <silent> <Leader>F :<C-u>NERDTreeToggle<CR>
" }}}

" **************************************************
" NERD Commenter {{{
" **************************************************
let g:NERDCreateDefaultMappings = 0 " デフォルトのキーマッピングを使用しない。
let g:NERDSpaceDelims           = 1 " コメントの前後にスペースを追加。
let g:NERDUsePlaceHolders       = 0 " 入れ子コメントにプレイスホルダーを使用しない。

" コメントアウト。
nmap <silent> <Leader>/c <Plug>NERDCommenterComment
vmap <silent> <Leader>/c <Plug>NERDCommenterComment

" 行コメントをトグル。
nmap <silent> <Leader>// <Plug>NERDCommenterToggle
vmap <silent> <Leader>// <Plug>NERDCommenterToggle

" 行コメントの状態を反転。
nmap <silent> <Leader>/? <Plug>NERDCommenterInvert
vmap <silent> <Leader>/? <Plug>NERDCommenterInvert

" 現在行の末尾にコメントを追加。
nmap <silent> <Leader>/a <Plug>NERDCommenterAppend

" 現在のカーソル位置から行末までをコメントアウト。
nmap <silent> <Leader>/$ <Plug>NERDCommenterToEOL

" コメント文字列を左揃えにして行をコメントアウト。
nmap <silent> <Leader>/< <Plug>NERDCommenterAlignLeft
vmap <silent> <Leader>/< <Plug>NERDCommenterAlignLeft

" コメント文字列を右揃えにして行をコメントアウト。
nmap <silent> <Leader>/> <Plug>NERDCommenterAlignRight
vmap <silent> <Leader>/> <Plug>NERDCommenterAlignRight

" 3部コメントを使用して最小のコメント文字列で行をコメントアウト。
nmap <silent> <Leader>/s <Plug>NERDCommenterSexy
vmap <silent> <Leader>/s <Plug>NERDCommenterSexy

" 最小のコメント文字列で行をコメントアウト。
nmap <silent> <Leader>/m <Plug>NERDCommenterMinimal
vmap <silent> <Leader>/m <Plug>NERDCommenterMinimal

" コメントのスタイルを切り替え。
nmap <silent> <Leader>/* <Plug>NERDCommenterAltDelims

" カーソル位置にコメントを挿入。
imap <silent> <C-_><C-_> <Plug>NERDCommenterInInsert
" }}}

" **************************************************
" Tagbar {{{
" **************************************************
let g:tagbar_width   = 31   " ウィンドウの幅。
let g:tagbar_compact = 1    " ヘルプメッセージと空行を非表示。

" 折り畳みの開閉を表す文字。
if &encoding == 'utf-8'
    let g:tagbar_iconchars = ['▸', '▾']
else
    let g:tagbar_iconchars = ['+', '-']
endif

let g:tagbar_autoshowtag = 0    " 現在のタグが折り畳み内にあるときは折り畳みを自動的に開く。

" CSS用の設定。
let g:tagbar_type_css = {
    \ 'ctagstype': 'Css',
    \ 'kinds'    : [
        \ 'c:classes',
        \ 's:selectors',
        \ 'i:identities'
    \ ]
\ }

" Tagbarの表示をトグル。
noremap <silent> <Leader>t :<C-u>TagbarToggle<CR>
" }}}

" **************************************************
" Powerline {{{
" **************************************************
let g:Powerline_symbols = 'fancy'   " パッチ済みのフォントを使用してカスタムアイコンと矢印を表示。
" let g:Powerline_theme   = 'theme'   " 使用するテーマ。

" .vimrc, .gvimrcの書き込み後に表示を更新。
autocmd vimrc_autocmd BufWritePost $MYVIMRC call Pl#UpdateStatusline(1)
if s:is_gui
    autocmd vimrc_autocmd BufWritePost $MYGVIMRC call Pl#UpdateStatusline(1)
endif
" }}}

" **************************************************
" Align Them All! {{{
" **************************************************
" '<Space>'で整列。
nnoremap <silent> <Leader>a<Space> V:<C-u>substitute/ \+/ /eg<CR>:<C-u>nohlsearch<CR>V:<C-u>Alignta <<0:0 \ <CR>
vnoremap <silent> <Leader>a<Space> :<C-u>'<,'>substitute/\%V \+/ /eg<CR>:<C-u>nohlsearch<CR>:<C-u>'<,'>Alignta <<0:0 \ <CR>

" '='で整列。
nnoremap <silent> <Leader>a= :<C-u>Alignta =<CR>
vnoremap <silent> <Leader>a= :<C-u>'<,'>Alignta =<CR>

" ','で整列。
nnoremap <silent> <Leader>a, :<C-u>:Alignta <<0:1 ,<CR>
vnoremap <silent> <Leader>a, :<C-u>'<,'>Alignta <<0:1 ,<CR>

" ':'で整列。
nnoremap <silent> <Leader>a: :<C-u>:Alignta <<0:1 :<CR>
vnoremap <silent> <Leader>a: :<C-u>'<,'>Alignta <<0:1 :<CR>

" 'commentstring'の正規表現を取得。
function! s:getCommentStringPattern()
    let pattern = escape(&commentstring, '^$[].*\~ ')
    let pattern = substitute(pattern, '%s', '.*', 'g')

    return pattern
endfunction

" コメント文字列で整列。
autocmd vimrc_autocmd BufEnter *
            \ execute 'nnoremap <silent> <Leader>a/ :<C-u>Alignta v/^\\s*' . s:getCommentStringPattern() .  ' <-- -r ' . s:getCommentStringPattern() . '<CR>' |
            \ execute 'vnoremap <silent> <Leader>a/ :Alignta v/^\\s*'      . s:getCommentStringPattern() .  ' <-- -r ' . s:getCommentStringPattern() . '<CR>'
" }}}

" **************************************************
" EasyMotion {{{
" **************************************************
" let g:EasyMotion_keys = '1234567890'    " モーションターゲットに使用するキー。

highlight EasyMotionTarget ctermfg=233 ctermbg=227 guifg=#1b1d1e guibg=#fdfd5f  " モーションターゲットのハイライト。
highlight EasyMotionShade  ctermfg= 59             guifg=#465457                " シェードテキストのハイライト。
" }}}

" **************************************************
" TabMan {{{
" **************************************************
let g:tabman_toggle   = '<Leader>mt'    " TabManをトグルするキーマッピング。
let g:tabman_focus    = '<Leader>mf'    " TabManのウィンドウにフォーカスするキーマッピング。
let g:tabman_width    = 31              " Tabmanのウィンドウの幅。
let g:tabman_side     = 'left'          " Tabmanのウィンドウの位置。
" let g:tabman_specials = 1               " プラグインによって作成されたヘルプ等のウィンドウを表示。
let g:tabman_number   = 0               " TabManのウィンドウに行番号を表示しない。
" }}}

" **************************************************
" Altr {{{
" **************************************************
" 前のファイルを開く。
nmap <silent> [-ex-]an <Plug>(altr-forward)

" 次のファイルを開く。
nmap <silent> [-ex-]ap <Plug>(altr-back)

" CSS用のルール。
call altr#define('*/%.css',
                \ 'scss/%.scss',
                \ 'sass/%.sass'
            \  )
call altr#define('%.css',
                \ 'scss/%.scss',
                \ 'sass/%.sass'
            \  )

" SCSS用のルール。
call altr#define('*/%.scss',
                \ '*/%.css',
                \ '%.css'
            \  )

" SASS用のルール。
call altr#define('*/%.sass',
                \ '*/%.css',
                \ '%.css'
            \  )
" }}}

" **************************************************
" Syntastic {{{
" **************************************************
" let g:syntastic_check_on_open      = 1  " ファイルを開いたときにシンタックスチェックを行う。
" let g:syntastic_echo_current_error = 0  " コマンドウィンドウに現在行のエラーを表示しない。

" モードの設定。
" パッシブモードをデフォルトに設定。
let g:syntastic_mode_map = {
                \ 'mode'             : 'passive',
                \ 'active_filetypes' : [],
                \ 'passive_filetypes': []
            \ }

" ステータスラインの内容。
let g:syntastic_stl_format  = '['               " 括弧(開き)
let g:syntastic_stl_format .= '%E{E(%e):%fe}'   " エラー数と最初のエラー行。
let g:syntastic_stl_format .= '%B{ }'           " スペース。
let g:syntastic_stl_format .= '%W{W(%w):%fw}'   " 警告数と最初の警告行。
let g:syntastic_stl_format .= ']'               " 括弧(閉じ)

" シンタックスチェックを起動。
nnoremap <silent> <Leader>sc :<C-u>SyntasticCheck<CR>

" Syntasticのアクティブモードとパッシブモードをトグル。
nnoremap <silent> [-option-]S :<C-u>SyntasticToggleMode<CR>

" エラーメッセージをロケーションリストで表示。
nnoremap <silent> <Leader>se :<C-u>Errors<CR>
" }}}

" **************************************************
" Indent Guides {{{
" **************************************************
let g:indent_guides_enable_on_vim_startup = 1   " Vimの起動時にプラグインを有効化。

" デフォルトのキーマッピングを無効化。
autocmd vimrc_autocmd VimEnter * nunmap <Leader>ig

" インデントのハイライトをトグル。
nnoremap <silent> [-option-]i :<C-u>IndentGuidesToggle<CR>

" インデントのハイライトを設定。
function! s:updateIndentGuides()
    " 奇数インデントの背景色を透明にする。
    silent! highlight IndentGuidesOdd ctermbg=NONE

    " 奇数インデントに'Normal'と同じハイライトを使用。
    " execute 'silent! highlight IndentGuidesOdd ctermbg=' . synIDattr(synIDtrans(hlID('Normal')), 'bg')

    " 偶数インデントに'ColorColumn'と同じハイライトを使用。
    execute 'silent! highlight IndentGuidesEven ctermbg=' . synIDattr(synIDtrans(hlID('ColorColumn')), 'bg')
endfunction

" GUI版以外はハイライトを指定。
if !s:is_gui
    let g:indent_guides_auto_colors = 0 " ハイライトカラーの自動計算を無効化。

    autocmd vimrc_autocmd VimEnter,ColorScheme * call s:updateIndentGuides()
endif

" .vimrc、.gvimrcの書き込み後に表示を更新。
autocmd vimrc_autocmd BufWritePost $MYVIMRC call s:updateIndentGuides()
if s:is_gui
    autocmd vimrc_autocmd BufWritePost $MYGVIMRC call s:updateIndentGuides()
endif
" }}}
"
" **************************************************
" Hier {{{
" **************************************************
" Hierをトグル。
nnoremap <silent><expr> [-option-]m g:hier_enabled ? ':<C-u>HierStop<CR>' : ':<C-u>HierStart<CR>'
" }}}

" **************************************************
" VimShell {{{
" **************************************************
" 追加で表示するプロンプト。
" 毎回カレントディレクトリを表示。
let g:vimshell_user_prompt = 'getcwd()'

" ウィンドウをポップアップ。
nnoremap <silent> <Leader>$$ :<C-u>VimShellPop<CR>

" PHPを起動。
nnoremap <silent> <Leader>$ph :<C-u>VimShellInteractive php<CR>

" Perlを起動。
nnoremap <silent> <Leader>$pe :<C-u>VimShellInteractive perlsh<CR>

" Pythonを起動。
nnoremap <silent> <Leader>$py :<C-u>VimShellInteractive python<CR>

" Irbを起動。
nnoremap <silent> <Leader>$rb :<C-u>VimShellInteractive irb<CR>

" 現在の行・選択文字列をインタプリターに送信。
nnoremap <silent> <Leader>$> <S-v>:VimShellSendString<CR>
vnoremap <silent> <Leader>$> :<C-u>'<,'>VimShellSendString<CR>
" }}}

" **************************************************
" Conque {{{
" **************************************************
" let g:ConqueTerm_InsertOnEnter    = 1               " バッファーに入ったときに自動的に挿入モードにする。
let g:ConqueTerm_CloseOnEnd       = 1               " プログラムが終了したら端末のバッファーを閉じる。
let g:ConqueTerm_ToggleKey        = '<Leader>%s'    " 端末の入出力表示をトグルするキー。
let g:ConqueTerm_ExecFileKey      = '<Leader>%x'    " 編集中のファイルをConqueバッファーで実行するキー。
let g:ConqueTerm_SendFileKey      = '<Leader>%>'    " ファイルの全ての内容をConqueバッファーに送信するキー。
let g:ConqueTerm_SendVisKey       = '<Leader>%>'    " 選択文字列をConqueバッファーに送信するキー。
" let g:ConqueTerm_SendFunctionKeys = 1               " ファンクションキーのキーイベントを端末に送信。

if s:is_win
    " Bashを起動。
    nnoremap <silent> <Leader>%% :<C-u>call conque_term#open('bash -i', ['split'])<CR>

    " Pythonを起動。
    nnoremap <silent> <Leader>%py :<C-u>call conque_term#open('python -i', ['split'])<CR>

    " Irbを起動。
    nnoremap <silent> <Leader>%rb :<C-u>call conque_term#open('irb --inf-ruby-mode', ['split'])<CR>
else
    " Bashを起動。
    nnoremap <silent> <Leader>%% :<C-u>call conque_term#open('bash', ['split'])<CR>

    " Pythonを起動。
    nnoremap <silent> <Leader>%py :<C-u>call conque_term#open('python', ['split'])<CR>

    " Irbを起動。
    nnoremap <silent> <Leader>%rb :<C-u>call conque_term#open('irb', ['split'])<CR>
endif

" PHPを起動。
nnoremap <silent> <Leader>%ph :<C-u>call conque_term#open('php -a', ['split'])<CR>

" Perlを起動。
nnoremap <silent> <Leader>%pe :<C-u>call conque_term#open('perlsh', ['split'])<CR>
" }}}

" **************************************************
" Fugitive {{{
" **************************************************
" git status。
nnoremap <Leader>gs :<C-u>Gstatus<CR>

" git commit。
nnoremap <Leader>gc :<C-u>Gcommit<CR>

" git commit --amend。
nnoremap <Leader>gC :<C-u>Git commit --amend<CR>

" git grep。
nnoremap <Leader>gg :<C-u>Ggrep 

" git log。
nnoremap <Leader>gl :<C-u>Glog<CR>
nnoremap <Leader>gL :<C-u>Glog 

" 指定したリビジョンを編集。
nnoremap <Leader>ge :<C-u>Gedit 

" 指定・選択したリビジョンを空のバッファーに読み込み。
nnoremap <Leader>gr :<C-u>Gread 

" ファイルに書き込み後、Gitのインデックスに追加。
nnoremap <Leader>gw :<C-u>Gwrite<CR>
nnoremap <Leader>gW :<C-u>Gwrite 

" git diff。
nnoremap <Leader>gd :<C-u>Gdiff<CR>
nnoremap <Leader>gD :<C-u>Gdiff 

" git mv。
nnoremap <Leader>gm :<C-u>Gmove 

" git rm。
nnoremap <Leader>gR :<C-u>Gremove<CR>

" git blame。
nnoremap <Leader>gb :<C-u>Gblame<CR>
nnoremap <Leader>gB :<C-u>Gblame 
" }}}

" **************************************************
" Gist {{{
" **************************************************
" '-c'オプションによるgistのクリップボードへのコピーに使用するコマンド。
if s:is_unix
    let g:gist_clip_command = 'xclip -selection clipboard'
elseif s:is_mac
    let g:gist_clip_command = 'pbcopy'
else
    let g:gist_clip_command = 'putclip'
endif

let g:gist_detect_filetype = 1  " ファイル名からファイルタイプを検出。
let g:gist_show_privates   = 1  " `:Gist -l`で非公開のgistを表示。
let g:gist_private         = 1  " デフォルトでgistを非公開にする。

" Gistのバッファーかどうかを判別。
function! s:isBufGist()
    let prefix = 'gist' . (has('unix') ? ':' : '_')
    let pattern = '^' . prefix . '\zs\([0-9a-f]\+\)\ze$'

    return (bufname('%') =~ pattern)
endfunction

" 現在のバッファー・選択範囲から非公開でgistを作成。
nnoremap <Leader>Gp :<C-u>Gist -p -s 
vnoremap <Leader>Gp :<C-u>'<,'>Gist -p -s 

" 現在のバッファー・選択範囲から公開でgistを作成。
nnoremap <Leader>GP :<C-u>Gist -P -s 
vnoremap <Leader>GP :<C-u>'<,'>Gist -P -s 

" 現在のバッファー・選択範囲から匿名でgistを作成。
nnoremap <Leader>Ga :<C-u>Gist -a -s 
vnoremap <Leader>Ga :<C-u>'<,'>Gist -a -s 

" 全てのバッファーからgistを作成。
nnoremap <silent> <Leader>Gm :<C-u>Gist -m<CR>

" バッファーで開いているgistを更新。
nnoremap <silent><expr> <Leader>Gu <SID>isBufGist() ? ':<C-u>Gist -e<CR>' : ''

" バッファーで開いているgistに説明を付けて更新。
nnoremap <expr> <Leader>GU <SID>isBufGist() ? ':<C-u>Gist -e -s ' : ''
vnoremap <expr> <Leader>GU <SID>isBufGist() ? ':<C-u>Gist -e -s ' : ''

" バッファーで開いているgistを削除。
nnoremap <silent><expr> <Leader>Gd <SID>isBufGist() ? ':<C-u>Gist -d<CR>' : ''

" バッファーで開いているgistをフォーク。
nnoremap <silent><expr> <Leader>Gf <SID>isBufGist() ? ':<C-u>Gist -f<CR>' : ''

" バッファーで開いているgistにスターを付ける。
nnoremap <silent><expr> <Leader>G+ <SID>isBufGist() ? ':<C-u>Gist +1<CR>' : ''

" バッファーで開いているgistからスターを外す。
nnoremap <silent><expr> <Leader>G- <SID>isBufGist() ? ':<C-u>Gist -1<CR>' : ''

" 指定・選択したIDのgistを取得。
nnoremap          <Leader>Gg :<C-u>Gist 
vnoremap <silent> <Leader>Gg :<C-u>execute 'Gist ' . <SID>getSelectedText()<CR>

" 指定・選択したIDのgistを取得してクリップボードに追加。
nnoremap          <Leader>Gc :<C-u>Gist -c 
vnoremap <silent> <Leader>Gc :<C-u>execute 'Gist -c ' . <SID>getSelectedText()<CR>

" gistを一覧表示。
nnoremap <silent> <Leader>Gls :<C-u>Gist -l<CR>

" 指定・選択したユーザーのgistを一覧表示。
nnoremap          <Leader>Glu :<C-u>Gist -l 
vnoremap <silent> <Leader>Glu :<C-u>execute 'Gist -l ' . <SID>getSelectedText()<CR>

" 全てのユーザーのgistを一覧表示。
nnoremap <silent> <Leader>Gla :<C-u>Gist -la<CR>

" スターの付いたgistを一覧表示。
nnoremap <silent> <Leader>Gl+ :<C-u>Gist -ls<CR>
" }}}

" **************************************************
" QFixToggle {{{
" **************************************************
" QuickFixウィンドウの表示をトグル。
nnoremap <silent> <Leader>q :<C-u>QFix<CR>
" }}}

" **************************************************
" Qfreplace {{{
" **************************************************
" 置換バッファーを開く。
autocmd vimrc_autocmd FileType qf nmap <silent><buffer> <Leader>R :<C-u>Qfreplace<CR>
" }}}

" **************************************************
" Eregex {{{
" **************************************************
" 前方検索。
nnoremap <C-_> :<C-u>M/

" 後方検索。
nnoremap <C-?> :<C-u>M?
" }}}

" **************************************************
" ZenCoding {{{
" **************************************************
let g:user_zen_leader_key  = '<C-c>'    " マップリーダー。
let g:use_zen_complete_tag = 1          " タグの補完にomnifuncを使用。

" ファイルタイプ別の設定。
let g:user_zen_settings = {
                \ 'lang': 'ja',
                \ 'html': {
                    \ 'indentation' : '    '
                \ }
            \ }
" }}}

" **************************************************
" numbers.vim {{{
" **************************************************
nnoremap <silent> [-option-]n :<C-u>NumbersToggle<CR>
" }}}

" **************************************************
" QuickRun {{{
" **************************************************
let g:quickrun_no_default_key_mappings = 1  " デフォルトのキーマッピングを使用しない。

" オプションのデフォルト値。
let g:quickrun_config = {
                \ '*': {
                    \ 'runmode': 'async:vimproc',
                    \ 'split': '{winwidth(0) * 2 < winheight(0) * 5 ? "" : "vertical rightbelow"}'
                \ }
            \ }

" 現在のバッファーに適したコマンドを実行。
nmap <silent> <Leader>x <Plug>(quickrun)
vmap <silent> <Leader>x <Plug>(quickrun)

" QuickLaunch
let g:loaded_quicklaunch                  = 1   " QuickLaunchを読み込まない。
" let g:quicklaunch_no_default_key_mappings = 1   "デフォルトのキーマッピングを使用しない。
" }}}

" **************************************************
" PDV {{{
" **************************************************
" PHPでDocBlockコメントを挿入。
autocmd vimrc_autocmd FileType php
            \ nnoremap <silent><buffer> <C-p> :<C-u>call PhpDocSingle()<CR> |
            \ inoremap <silent><buffer> <C-p> <C-o>:<C-u>call PhpDocSingle()<CR>i |
            \ vnoremap <silent><buffer> <C-p> :<C-u>call PhpDocRange()<CR>
" }}}

" **************************************************
" vim-php-namespace {{{
" **************************************************
" use文を自動挿入。
autocmd vimrc_autocmd FileType php
            \ noremap  <silent><buffer> <C-_>u :<C-u>call PhpInsertUse()<CR> |
            \ inoremap <silent><buffer> <C-_>u <C-o>:<C-u>call PhpInsertUse()<CR>

" }}}

" **************************************************
" vim-php-namespace {{{
" **************************************************
let g:tagbar_phpctags_bin = expand('$HOME/.bundle/phpctags/phpctags')
" }}}

" **************************************************
" vim-symfony {{{
" **************************************************
let g:symfony_enable_shell_mapping = 0    " Symfonyコンソールのキーマッピングを無効化。

" Symfonyコンソールを起動。
autocmd vimrc_autocmd FileType php
            \ noremap  <silent><buffer> <LocalLeader>$s :<C-u>execute ":!"g:symfony_enable_shell_cmd<CR>
" }}}

" **************************************************
" Riv {{{
" **************************************************
" @TODO: 設定を追加。
" }}}

" **************************************************
" DrawIt {{{
" **************************************************
" 描画文字を変更(1)
nnoremap <expr> <Leader>db1 exists('*SetDrawIt') ? SetDrawIt('\|', '-', '+', '\', '/', 'X', '*') : ''

" 描画文字を変更(2)
nnoremap <expr> <Leader>db2 exists('*SetDrawIt') ? SetDrawIt('\|', '=', '+', '\', '/', 'X', '*') : ''

" cecutil.vim: ウィンドウ・バッファーの位置を保存・復元。
" (Refソースのwordpress用キーマッピングとの衝突回避。)
nmap <silent> [-ex-]swp <Plug>SaveWinPosn
nmap <silent> [-ex-]rwp <Plug>RestoreWinPosn
" }}}

" **************************************************
" ColorV {{{
" **************************************************
let g:ColorV_prev_css = 0                   " CSSファイルでのカラーテキストの自動プレビューを無効化。
" let g:ColorV_no_global_map = 1              " デフォルトのキーマッピングを使用しない。
" let g:ColorV_global_leader = '<Leader>c'    " マップリーダー。

" バッファー内のカラーテキストをプレビュー。
function! s:colorvPreview()
    augroup colorv-preview
        autocmd!
        " autocmd BufWinEnter,BufWritePost,CursorMoved,CursorMovedI <buffer> call colorv#preview('s')
        autocmd BufWinEnter,BufWritePost <buffer> call colorv#preview('s')
    augroup END
endfunction

" CSS、SCSSでカラーテキストをプレビュー。
autocmd vimrc_autocmd FileType css,scss call s:colorvPreview()
" }}}

" **************************************************
" Lingr {{{
" **************************************************
" Lingrをトグル。
nnoremap <silent><expr> <Leader>l
            \ (exists(':LingrLaunch') == 2 && exists(':LingrExit') != 2) ? ':<C-u>LingrLaunch<CR>' :
            \ exists(':LingrExit') == 2 ? ':<C-u>LingrExit<CR>' : ''
" }}}

" **************************************************
" phprefactor
" **************************************************

let g:phprefactor_no_default_key_mappings = 1   " デフォルトのキーマッピングを使用しない。

" ローカル変数をリファクタリング。
autocmd vimrc_autocmd FileType php
            \ nmap <LocalLeader>rr <Plug>(phprefactor_rename_local_variable)|
            \ vmap <LocalLeader>rv <Plug>(phprefactor_introduce_local_variable)
" }}}

" **************************************************
" Rainbow Pairs {{{
" **************************************************
let g:rainbow_pairs_enable_key_mappings = 0 " デフォルトのキーマッピングを使用しない。

" Rainbow Pairsをトグル。
nmap [-option-]p <Plug>(rainbow_pairs_toggle)
" }}}

" **************************************************
" Unite {{{
" **************************************************
" Unite用マップリーダー。
noremap [-unite-] <Nop>
map     <C-\>     [-unite-]

let g:unite_enable_start_insert              = 0    " 通常モードで開始。
let g:unite_source_file_mru_limit            = 1000 " 最近使用したファイルの最大保存数。
let g:unite_source_directory_mru_limit       = 1000 " 最近使用したディレクトリの最大保存数。
let g:unite_source_history_yank_enable       = 1    " unite-source-history/yankを有効化。
let g:unite_source_history_yank_limit        = 1000 " ヤンク履歴を保存する最大数。
let g:unite_kind_jump_list_after_jump_scroll = 50   " unite-kind-jump_listでのジャンプ後のカーソル位置をウィンドウ中央にする。

" ブックマークディレクトリをVimFilerで開く。
call unite#custom_default_action('bookmark/directory', 'vimfiler')

" `X`でアクションを選択。
autocmd vimrc_autocmd FileType unite
            \ nmap <silent><buffer> X <Plug>(unite_choose_action)|
            \ imap <silent><buffer> X <Plug>(unite_choose_action)

" '<Esc><Esc>'でUniteを閉じる。
autocmd vimrc_autocmd FileType unite
            \ nmap <silent><buffer> <Esc><Esc> <Plug>(unite_exit)

" バッファー一覧。
nnoremap <silent> [-unite-]b :<C-u>Unite -buffer-name=buffer buffer<CR>

" ウィンドウ一覧。
nnoremap <silent> [-unite-]w :<C-u>Unite -buffer-name=window window<CR>

" タブ一覧。
nnoremap <silent> [-unite-]t :<C-u>Unite -buffer-name=tab tab<CR>

" ファイル一覧。
nnoremap <silent> [-unite-]. :<C-u>UniteWithBufferDir -buffer-name=file file<CR>

" レジスタ一覧。
nnoremap <silent> [-unite-]@ :<C-u>Unite -buffer-name=register register<CR>

" ヤンクの履歴一覧。
nnoremap <silent> [-unite-]hy :<C-u>Unite -buffer-name=yank history/yank<CR>

" スニペット一覧。
nnoremap <silent> [-unite-]s :<C-u>Unite -buffer-name=snippet snippet<CR>

" セッション一覧。
nnoremap <silent> [-unite-]S? :<C-u>Unite -buffer-name=session session<CR>

" セッションを保存。
nnoremap <silent> [-unite-]Ss :<C-u>UniteSessionSave<CR>

" セッションを読み込み。
nnoremap <silent> [-unite-]Sl :<C-u>UniteSessionLoad<CR>

" セッションを名前を指定して読み込み。
nnoremap [-unite-]SL :<C-u>UniteSessionLoad 

" セッションを名前を付けて保存。
nnoremap [-unite-]SS :<C-u>UniteSessionSave 

" 最近使用したファイル一覧。
nnoremap <silent> [-unite-]m :<C-u>Unite -buffer-name=file file_mru<CR>

" ブックマーク一覧。
nnoremap <silent> [-unite-]* :<C-u>Unite -buffer-name=bookmark -default-action=file bookmark<CR>

" Grep。
nnoremap <silent> [-unite-]g :<C-u>Unite -buffer-name=grep -start-insert grep<CR>

" Find。
nnoremap <silent> [-unite-]f :<C-u>Unite -buffer-name=find -start-insert find<CR>

" バッファーを行検索。
nnoremap <silent> [-unite-]/ :<C-u>Unite -buffer-name=line -start-insert line<CR>

" カーソル位置の単語でバッファーを行検索。
function! s:smartSearch()
    let @/ = expand('<cword>')
    UniteWithCursorWord -buffer-name=line line
endfunction
nnoremap <silent> [-unite-]? :<C-u>call <SID>smartSearch()<CR>

" プラグイン一覧(NeoBundle)。
nnoremap <silent> [-unite-]p? :<C-u>Unite -buffer-name=neobundle neobundle<CR>

" プラグインのインストールログ(NeoBundle)。
nnoremap <silent> [-unite-]pl :<C-u>Unite -buffer-name=neobundle neobundle/log<CR>

" プラグインをインストール(NeoBundle)。
nnoremap <silent> [-unite-]pi :<C-u>Unite -buffer-name=neobundle neobundle/install<CR>

" プラグインをアップデート(NeoBundle)。
nnoremap <silent> [-unite-]pu :<C-u>Unite -buffer-name=neobundle neobundle/update<CR>

" アウトライン一覧(unite-outline)。
nnoremap <silent> [-unite-]o :<C-u>Unite -buffer-name=outline outline<CR>

" マーク一覧(unite-mark)。
let g:unite_source_mark_marks = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ'  " 一覧に表示するマークの種類。
nnoremap <silent> [-unite-]` :<C-u>Unite -buffer-name=mark mark<CR>
nnoremap <silent> [-unite-]' :<C-u>Unite -buffer-name=mark mark<CR>

" カラースキーム一覧(unite-colorscheme)。
nnoremap <silent> [-unite-]c :<C-u>Unite -buffer-name=colorscheme colorscheme<CR>

" ヘルプを検索(unite-help)。
nnoremap <silent> [-unite-]H :<C-u>Unite -buffer-name=help -start-insert help<CR>

" タグ一覧(unite-tag)。
nnoremap <silent> [-unite-]]] :<C-u>Unite -buffer-name=tag tag<CR>

" タグを含むファイル一覧(unite-tag)。
nnoremap <silent> [-unite-]]? :<C-u>Unite -buffer-name=tag/file tag/file<CR>

" インクルードしているファイルのタグ一覧(unite-tag)。
nnoremap <silent> [-unite-]]} :<C-u>Unite -buffer-name=tag/include tag/include<CR>

" コマンド履歴一覧(unite-history)。
nnoremap <silent> [-unite-]h: :<C-u>Unite -buffer-name=command history/command<CR>

" 検索履歴一覧(unite-history)。
nnoremap <silent> [-unite-]h/ :<C-u>Unite -buffer-name=search history/search<CR>
" }}}

" **************************************************
" Ref {{{
" **************************************************
let g:ref_phpmanual_path = expand('$HOME/Documents/references/php_manual_ja')   " PHPマニュアルのパス。

" 英辞郎を参照。
" nnoremap <Leader>ra :<C-u>Ref alc<Space>
nnoremap <silent> <Leader>ra :<C-u>Unite -buffer-name=ref/alc -default-action=below -start-insert ref/alc<CR>
nnoremap <silent> <C-k>a     :<C-u>call ref#jump('normal', 'alc')<CR>
vnoremap <silent> <C-k>a     :<C-u>call ref#jump('visual', 'alc')<CR>

" PHPマニュアルを参照。
" nnoremap <Leader>rph :<C-u>Ref phpmanual<Space>
nnoremap <silent> <Leader>rph :<C-u>Unite -buffer-name=ref/phpmanual -default-action=below -start-insert ref/phpmanual<CR>
nnoremap <silent> <C-k>ph     :<C-u>call ref#jump('normal', 'phpmanual')<CR>
vnoremap <silent> <C-k>ph     :<C-u>call ref#jump('visual', 'phpmanual')<CR>

" Pythonドキュメントを参照。
" nnoremap <Leader>rpy :<C-u>Ref pydoc<Space>
nnoremap <silent> <Leader>rpy :<C-u>Unite -buffer-name=ref/pydoc -default-action=below -start-insert ref/pydoc<CR>
nnoremap <silent> <C-k>py     :<C-u>call ref#jump('normal', 'pydoc')<CR>
vnoremap <silent> <C-k>py     :<C-u>call ref#jump('visual', 'pydoc')<CR>

" Perlドキュメントを参照。
" nnoremap <Leader>rpe :<C-u>Ref perldoc<Space>
nnoremap <silent> <Leader>rpe :<C-u>Unite -buffer-name=ref/perldoc -default-action=below -start-insert ref/perldoc<CR>
nnoremap <silent> <C-k>pe     :<C-u>call ref#jump('normal', 'perldoc')<CR>
vnoremap <silent> <C-k>pe     :<C-u>call ref#jump('visual', 'perldoc')<CR>

" Rubyリファレンスを参照。
" nnoremap <Leader>rrb :<C-u>Ref refe<Space>
nnoremap <silent> <Leader>rrb :<C-u>Unite -buffer-name=ref/refe -default-action=below -start-insert ref/refe<CR>
nnoremap <silent> <C-k>rb     :<C-u>call ref#jump('normal', 'refe')<CR>
vnoremap <silent> <C-k>rb     :<C-u>call ref#jump('visual', 'refe')<CR>

" Linuxコマンドのマニュアルを参照。
" nnoremap <Leader>rm :<C-u>Ref man<Space>
nnoremap <silent> <Leader>rm :<C-u>Unite -buffer-name=ref/man -default-action=below -start-insert ref/man<CR>
nnoremap <silent> <C-k>m     :<C-u>call ref#jump('normal', 'man')<CR>
vnoremap <silent> <C-k>m     :<C-u>call ref#jump('visual', 'man')<CR>

" RFCを参照。
nnoremap          <Leader>rrf :<C-u>Ref rfc<Space>
nnoremap <silent> <C-k>rf     :<C-u>call ref#jump('normal', 'rfc')<CR>
vnoremap <silent> <C-k>rf     :<C-u>call ref#jump('visual', 'rfc')<CR>

" WordPress Codexを参照。
nnoremap <Leader>rwp          :<C-u>Ref wordpress<Space>
nnoremap <silent> <C-k>wp     :<C-u>call ref#jump('normal', 'wordpress')<CR>
vnoremap <silent> <C-k>wp     :<C-u>call ref#jump('visual', 'wordpress')<CR>

" ========================================
" ref-sources {{{
" ========================================
let g:ref_alc2_overwrite_alc = 1                                            " ref-alcをref-alc2で上書き。
let g:ref_jquery_doc_path    = expand('$HOME/Documents/references/jqapi')   " jQAPIのパス。
" let g:ref_auto_resize        = 1                                            " 自動リサイズを有効化。
let g:ref_wikipedia_lang     = ['ja', 'en']                                 " 使用するWikipediaの言語。

" Wikipedia(日本語)を参照。
" nnoremap <silent> <Leader>rwj :<C-u>Unite -buffer-name=ref/wikipedia_ja -default-action=below -start-insert ref/wikipedia<CR>
nnoremap          <Leader>rwj :<C-u>Ref wikipedia<Space>
nnoremap <silent> <C-k>wj     :<C-u>call ref#jump('normal', 'wikipedia')<CR>
vnoremap <silent> <C-k>wj     :<C-u>call ref#jump('visual', 'wikipedia')<CR>

" Wikipedia(英語)を参照。
" nnoremap <silent> <Leader>rwe :<C-u>Unite -buffer-name=ref/wikipedia_en -default-action=below -start-insert ref/wikipedia_en<CR>
nnoremap          <Leader>rwe :<C-u>Ref wikipedia_en<Space>
nnoremap <silent> <C-k>we     :<C-u>call ref#jump('normal', 'wikipedia_en')<CR>
vnoremap <silent> <C-k>we     :<C-u>call ref#jump('visual', 'wikipedia_en')<CR>

" jQAPIを参照。
" nnoremap <Leader>rjq :<C-u>Ref jquery<Space>
nnoremap <silent> <Leader>rjq :<C-u>Unite -buffer-name=ref/jquery -default-action=below -start-insert ref/jquery<CR>
nnoremap <silent> <C-k>jq     :<C-u>call ref#jump('normal', 'jquery')<CR>
vnoremap <silent> <C-k>jq     :<C-u>call ref#jump('visual', 'jquery')<CR>
" }}}

" ========================================
" ref-dicts-en {{{
" ========================================
" Oxford Dictionariesを参照。
nnoremap          <Leader>ro :<C-u>Ref oxford<Space>
nnoremap <silent> <C-k>o     :<C-u>call ref#jump('normal', 'oxford')<CR>
vnoremap <silent> <C-k>o     :<C-u>call ref#jump('visual', 'oxford')<CR>

" Synonym.comを参照。
nnoremap          <Leader>rs :<C-u>Ref synonym<Space>
nnoremap <silent> <C-k>s     :<C-u>call ref#jump('normal', 'synonym')<CR>
vnoremap <silent> <C-k>s     :<C-u>call ref#jump('visual', 'synonym')<CR>
" }}}

" }}}

" **************************************************
" テキストオブジェクト {{{
" **************************************************
" ========================================
" textobj-datetime {{{
" ========================================
let g:textobj_datetime_no_default_key_mappings = 1  " デフォルトのキーマッピングを使用しない。

" 日付・時間を選択。
omap ad <Plug>(textobj-datetime-auto)
vmap ad <Plug>(textobj-datetime-auto)
omap id <Plug>(textobj-datetime-auto)
vmap id <Plug>(textobj-datetime-auto)
" }}}

" }}}

" **************************************************
" オペレーター {{{
" **************************************************
" ========================================
" operator-html-escape {{{
" ========================================
" テキストオブジェクトの文字を文字実体参照に変換。
map [-op-]h <Plug>(operator-html-escape)

" テキストオブジェクトの文字実体参照を文字に変換。
map [-op-]H <Plug>(operator-html-unescape)
" }}}

" }}}

" }}}



" ############################################################
" コマンド {{{
" ############################################################
" ファイル名を変更。
command! -bang -bar -nargs=1 -complete=file Rename file<bang> <args> | call delete(expand('#'))

" コンパイラーを一時的に変更して`:command`を実行。
function! s:makeWith(command, compiler)
    if exists('g:current_compiler')
        let _current_compiler = g:current_compiler

        execute 'compiler! ' . a:compiler
        execute a:command
        execute 'compiler! ' . _current_compiler

        unlet _current_compiler
    else
        execute 'compiler! ' . a:compiler
        execute a:command
        unlet g:current_compiler
    endif
endfunction

" コンパイラーを一時的に変更して`:make`。
command! -bang -bar -nargs=1 MakeWith  call s:makeWith('make<bang>', <f-args>)

" コンパイラーを一時的に変更して`:lmake`。
command! -bang -bar -nargs=1 LMakeWith call s:makeWith('lmake<bang>', <f-args>)

" 差分モードから抜けたときに設定を元に戻すために設定を保存。
autocmd vimrc_autocmd BufWinEnter *
            \ if !&l:diff && !exists('b:undo_diff') |
                \ let b:undo_diff = 'setlocal ' .
                    \ 'nodiff ' .
                    \ (&scrollbind ? 'scrollbind' : 'noscrollbind') . ' ' .
                    \ (&cursorbind ? 'cursorbind' : 'nocursorbind') . ' ' .
                    \ 'scrollopt=' . &scrollopt  . ' ' .
                    \ (&wrap ? 'wrap' : 'nowrap') . ' ' .
                    \ 'foldmethod=' . &foldmethod . ' ' .
                    \ 'foldcolumn=' . &foldcolumn |
            \ endif

" 'filename'が存在するファイルのときは'filename'との差分を表示。
" 'filename'が空のときは現在のバッファーの差分を表示。
function! s:smartDiff(filename)
    if a:filename != '' && !filereadable(a:filename)
        return
    endif

    if a:filename == ''
        vertical new
        setlocal buftype=nofile
        read #
        0d_
        diffthis
        wincmd p
        diffthis
    else
        execute 'vertical diffsplit ' . a:filename
    endif
endfunction

" ウィンドウを垂直分割して差分モードに移行。
command! -nargs=? -complete=file VDiff call s:smartDiff('<args>')

" 設定を元に戻して差分モードから抜ける。
function! s:undiff()
    if exists('b:undo_diff')
        execute b:undo_diff
    else
        execute 'setlocal ' .
                    \ 'nodiff ' .
                    \ 'scrollbind< ' .
                    \ 'cursorbind< ' .
                    \ 'scrollopt< ' .
                    \ 'wrap< ' .
                    \ 'foldmethod< ' .
                    \ 'foldcolumn<'
    endif
endfunction
command! -nargs=0 Undiff call s:undiff()
" }}}



" ############################################################
" 関数 {{{
" ############################################################
" オプションをトグル。
function! s:toggleOption(option_name)
    execute 'setlocal' a:option_name . '!'
    execute 'setlocal' a:option_name . '?'
endfunction

" 選択したテキストを取得。
function! s:getSelectedText()
    let tmp = @@
    silent normal gvy
    let selected = @@
    let @@ = tmp

    return selected
endfunction
" }}}



" ############################################################
" ローカル設定を読み込み {{{
" ############################################################
if filereadable(expand('$HOME/.vimrc_local'))
    execute 'source ' . expand('$HOME/.vimrc_local')
endif

" カレントディレクトリ内の'.vimrc'や'.exrc'では`:autocmd`やシェルコマンド、書き込みコマンドを使用しない。
" マッピングコマンドを表示する。
set secure
" }}}

if exists('current_compiler')
    finish
endif

let current_compiler = 'javascript'

let s:_cpoptions = &cpoptions
set cpoptions-=C

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=rhino\ -w\ -strict\ %
CompilerSet errorformat=%Ejs:\ \"%f\"\\,\ line\ %l:\ %m,
            \%Wjs:\ warning:\ \"%f\"\\,\ line\ %l:\ %m,
            \%-G%.%#

let &cpoptions = s:_cpoptions
unlet s:_cpoptions

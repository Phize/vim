if exists('current_compiler')
    finish
endif

let current_compiler = 'rhinoed_jslint'

let s:_cpoptions = &cpoptions
set cpoptions-=C

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=rhinoed_jslint\ %
CompilerSet errorformat=%A[%f]\ Lint\ at\ line\ %l\ character\ %c:\ %m,
            \%-G%.%#

let &cpoptions = s:_cpoptions
unlet s:_cpoptions

if exists('current_compiler')
    finish
endif

let current_compiler = 'csslint'

let s:_cpoptions = &cpoptions
set cpoptions-=C

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=csslint-rhino\ --format=compact\ %
CompilerSet errorformat=%A%f:\ line\ %l\\,\ col\ %c\\,\ %m,
            \%-G%.%#

let &cpoptions = s:_cpoptions
unlet s:_cpoptions

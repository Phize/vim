if exists('current_compiler')
    finish
endif

let current_compiler = 'jshint'

let s:_cpoptions = &cpoptions
set cpoptions-=C

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=jshint-rhino\ %
CompilerSet errorformat=%A%m\ (%f:%l:%c),
            \%-G%.%#

let &cpoptions = s:_cpoptions
unlet s:_cpoptions

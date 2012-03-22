if exists('current_compiler')
    finish
endif

let current_compiler = 'phpcs_zend'

let s:_cpoptions = &cpoptions
set cpoptions-=C

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=phpcs\ --standard=Zend\ --report-width=999\ %
CompilerSet errorformat=%-PFILE:\ %f,
            \%E\ %\\+%l\ \|\ ERROR\ %\\+\|\ %m,
            \%W\ %\\+%l\ \|\ WARNING\ %\\+\|\ %m,
            \%-G%.%#

let &cpoptions = s:_cpoptions
unlet s:_cpoptions

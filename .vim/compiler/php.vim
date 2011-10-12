if exists('current_compiler')
    finish
endif

let current_compiler = 'php'

let s:_cpoptions = &cpoptions
set cpoptions-=C

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=php\ -lq\ %
CompilerSet errorformat=%E<b>PHP\ Parse\ error</b>:\ %m\ in\ <b>%f</b>\ on\ line\ <b>%l</b><br\ />,
            \%W<b>PHP\ Notice</b>:\ %m\ in\ <b>%f</b>\ on\ line\ <b>%l</b><br\ />,
            \%EPHP\ Parse\ error:\ %m\ in\ %f\ on\ line\ %l,
            \%WPHP\ Notice:\ %m\ in\ %f</b>\ on\ line\ %l,
            \%-G%.%#

let &cpoptions = s:_cpoptions
unlet s:_cpoptions

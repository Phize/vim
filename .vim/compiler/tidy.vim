if exists('current_compiler')
    finish
endif

let current_compiler = 'tidy'

let s:_cpoptions = &cpoptions
set cpoptions-=C

if exists(':CompilerSet') != 2
    command -nargs=* CompilerSet setlocal <args>
endif

CompilerSet makeprg=tidy\ -quiet\ -errors\ --gnu-emacs\ yes\ -utf8\ %
CompilerSet errorformat=%E%f:%l:%c:\ Error:%m,
            \%W%f:%l:%c:\ Warning:%m,
            \%-G%.%#

let &cpoptions = s:_cpoptions
unlet s:_cpoptions

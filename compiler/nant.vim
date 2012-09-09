" Vim Compiler File
" Compiler:	nant
" Maintainer:	focusing
" Last Change:	Sat, 18 Aug 2012 12:59:00 GMT

if exists("current_compiler")
    finish
endif
let current_compiler = "nant"

if exists(":CompilerSet") != 2		" older Vim always used :setlocal
  command -nargs=* CompilerSet setlocal <args>
endif

let s:cpo_save = &cpo
set cpo&vim

CompilerSet makeprg=nant\ -find\ -nologo

" first  line:
"     ant with jikes +E, which assumes  the following
"     two property lines in your 'build.xml':
"
"         <property name = "build.compiler"       value = "jikes"/>
"         <property name = "build.compiler.emacs" value = "true"/>
"
" second line:
"     ant with javac
"
" note that this will work also for tasks like [wtkbuild]
"
"CompilerSet errorformat=\ %#[%.%#]\ %#%f:%l:%v:%*\\d:%*\\d:\ %t%[%^:]%#:%m,
"    \%A\ %#[%.%#]\ %f:%l:\ %m,
"%-Z\ %#[%.%#]\ %p^,
"%C\ %#[%.%#]\ %#%m
" ,%-C%.%#

CompilerSet errorformat=\ %#[%.%#]\ %f(%l\\,%c):\ %t%*[^\ ]\ %[A-Z]%#%n:\ %m,%>\ %#[%.%#]\ %f(%l\\,%c):\ %m

let &cpo = s:cpo_save
unlet s:cpo_save

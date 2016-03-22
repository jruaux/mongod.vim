" Vim syntax file
" Language:         mongod log file
" Maintainer:       Julien Ruaux <jruaux at gmail>
" Latest Revision:  2016-03-22

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

syn match   mongodBegin       display '^' nextgroup=mongodDateTime

syn match   mongodDateTime    contained display '\d\d\d\d-\d\d-\d\dT\d\d\:\d\d\:\d\d\.\d\d\d\S\+\s\+'
                              \ nextgroup=mongodError,mongodWarning,mongodInfo

syn match   mongodError       contained display 'F\|E'
                              \ nextgroup=mongodComponent

syn match   mongodWarning     contained display 'W'
                              \ nextgroup=mongodComponent

syn match   mongodInfo        contained display 'I\|D'
                              \ nextgroup=mongodComponent

syn match   mongodComponent   contained display '\s\+\S\+\s\+'
                              \ nextgroup=mongodContext

syn match   mongodContext     contained display '\[.\{-1,}\]\s\+'
                              \ nextgroup=mongodText

syn match   mongodText        contained display '.*'
                              \ contains=mongodDuration

syn match   mongodDuration    contained '\d\+ms'

hi def link mongodDateTime    Constant
hi def link mongodError       ErrorMsg
hi def link mongodWarning     Special
hi def link mongodComponent   Identifier
hi def link mongodContext     Operator
hi def link mongodText        Normal
hi def link mongodDuration    Number

let b:current_syntax = "mongod"

let &cpo = s:cpo_save
unlet s:cpo_save

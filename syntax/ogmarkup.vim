" Vim syntax file
" Language:     Ogmarkup
" Maintainer:   Laurent Georget <laurent@lgeorget.eu>
" Filenames:    *.ogmarkup
" Last Change:  2016 March 26

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Errors
syn match	ogmarkupBracketErr	"]"
syn match	ogmarkupAngleErr	">"

" Usual markup
syn region	ogmarkupQuote matchgroup=ogmarkupBrack start=+"+ matchgroup=ogmarkupBrack end=+"+ contains=ogmarkupQuoteEmph,ogmarkupQuoteStrongEmph
syn region	ogmarkupQuoteEmph contained matchgroup=ogmarkupBrack start=+\*+ matchgroup=ogmarkupBrack end=+\*+ contains=ogmarkupQuoteEmphStrongEmph
syn region	ogmarkupQuoteEmphStrongEmph contained matchgroup=ogmarkupBrack start="+" matchgroup=ogmarkupBrack end="+"
syn region	ogmarkupQuoteStrongEmph contained matchgroup=ogmarkupBrack start="+" matchgroup=ogmarkupBrack end="+" contains=ogmarkupQuoteStrongEmphEmph
syn region	ogmarkupQuoteStrongEmphEmph contained matchgroup=ogmarkupBrack start=+\*+ matchgroup=ogmarkupBrack end=+\*+

syn region	ogmarkupEmph matchgroup=ogmarkupBrack start=+\*+ matchgroup=ogmarkupBrack end=+\*+ contains=ogmarkupEmphQuote,ogmarkupEmphStrongEmph
syn region	ogmarkupEmphQuote contained matchgroup=ogmarkupBrack start=+"+ matchgroup=ogmarkupBrack end=+"+ contains=ogmarkupEmphQuoteStrongEmph
syn region	ogmarkupEmphQuoteStrongEmph contained matchgroup=ogmarkupBrack start="+" matchgroup=ogmarkupBrack end="+"
syn region	ogmarkupEmphStrongEmph contained matchgroup=ogmarkupBrack start="+" matchgroup=ogmarkupBrack end="+" contains=ogmarkupEmphStrongEmphQuote
syn region	ogmarkupEmphStrongEmphQuote contained matchgroup=ogmarkupBrack start=+"+ matchgroup=ogmarkupBrack end=+"+

syn region	ogmarkupStrongEmph transparent matchgroup=ogmarkupBrack start="+" matchgroup=ogmarkupBrack end="+" contains=ogmarkupStrongEmphEmph,ogmarkupStrongEmphQuote
syn region	ogmarkupStrongEmphQuote contained matchgroup=ogmarkupBrack start=+"+ matchgroup=ogmarkupBrack end=+"+ contains=ogmarkupStrongEmphQuoteEmph
syn region	ogmarkupStrongEmphQuoteEmph contained matchgroup=ogmarkupBrack start=+\*+ matchgroup=ogmarkupBrack end=+\*+
syn region	ogmarkupStrongEmphEmph contained matchgroup=ogmarkupBrack start=+\*+ matchgroup=ogmarkupBrack end=+\*+ contains=ogmarkupStrongEmphEmphQuote
syn region	ogmarkupStrongEmphEmphQuote contained matchgroup=ogmarkupBrack start=+"+ matchgroup=ogmarkupBrack end=+"+

" Enclosing
syn region	ogmarkupSpeech matchgroup=ogmarkupBrack start="\[" matchgroup=ogmarkupBrack end="\]" contains=ogmarkupClause
syn region	ogmarkupThought matchgroup=ogmarkupBrack start="<" matchgroup=ogmarkupBrack end=">" contains=ogmarkupClause

syn region	ogmarkupClause matchgroup=ogmarkupBrack start="|" matchgroup=ogmarkupBrack end="|" nextgroup=ogmarkupSpeech

syn region	ogmarkupIdentifier matchgroup=ogmarkupIdentifierTag start="\]\@<=(" matchgroup=ogmarkupIdentifierTag end=")"

" Aside
syn match	ogmarkupAside "_\{4,}"
syn match	ogmarkupAside "_\{4,}.\{-}_\{4,}" contains=ogmarkupAsideClass

syn match	ogmarkupAsideClass contained "[a-zA-Z]"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_ogmarkup_syntax_inits")
  if version < 508
    let did_ogmarkup_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink ogmarkupBracketErr	 Error

  HiLink ogmarkupSpeech		String
  HiLink ogmarkupThought	String
  HiLink ogmarkupBrack		Comment
  HiLink ogmarkupIdentifierTag	Keyword
  HiLink ogmarkupIdentifier	Identifier

  hi def ogmarkupEmph cterm=italic term=italic gui=italic
  hi def ogmarkupStrongEmph cterm=bold term=bold gui=bold
  hi def ogmarkupStrongEmphEmph cterm=italic,bold term=italic,bold gui=italic,bold
  HiLink ogmarkupEmphStrongEmph ogmarkupStrongEmphEmph
  hi def ogmarkupQuote cterm=underline term=underline gui=underline
  hi def ogmarkupQuoteEmph cterm=underline,italic term=underline,italic gui=underline,italic
  HiLink ogmarkupEmphQuote ogmarkupQuoteEmph
  hi def ogmarkupStrongEmphQuote cterm=underline,bold term=underline,bold gui=underline,bold
  HiLink ogmarkupQuoteStrongEmph ogmarkupStrongEmphQuote
  hi def ogmarkupQuoteStrongEmphEmph cterm=underline,bold,italic term=underline,bold,italic gui=underline,bold,italic
  HiLink ogmarkupQuoteEmphStrongEmph ogmarkupQuoteStrongEmphEmph
  HiLink ogmarkupStrongEmphQuoteEmph ogmarkupQuoteStrongEmphEmph
  HiLink ogmarkupStrongEmphEmphQuote ogmarkupQuoteStrongEmphEmph
  HiLink ogmarkupEmphQuoteStrongEmph ogmarkupQuoteStrongEmphEmph
  HiLink ogmarkupEmphStrongEmphQuote ogmarkupQuoteStrongEmphEmph

  HiLink ogmarkupAside		Comment
  HiLink ogmarkupAsideClass	Identifier

  delcommand HiLink
endif

let b:current_syntax = "ogmarkup"

" vim: ts=8

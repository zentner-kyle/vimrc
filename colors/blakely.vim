" blakely colour scheme
" Author:      Kyle Zentner
" Version:     1.0
" Last Change: Feb 16, 2015

set background=dark
highlight clear
if exists("syntax_on")
  syntax reset
endif

let g:colors_name = 'blakely'

hi Comment		gui=italic			guifg=#8888aa
hi Constant		gui=bold			guifg=#0077bb
hi Cursor		gui=none	guibg=white	guifg=#ff0000
hi Directory		gui=none			guifg=#006688
hi Identifier		gui=none			guifg=#bbbbbb
hi Normal		gui=bold	guibg=black	guifg=#888899
hi PreProc		gui=bold			guifg=#990099
hi Statement		gui=bold			guifg=#999999
hi Type			gui=none			guifg=#555555
hi Visual		gui=none	guibg=#222222	guifg=#ff0000
hi DiffAdd		gui=bold			guifg=#00ff00	
hi DiffDelete		gui=bold			guifg=#ff0000
hi DiffChange		gui=none			guifg=#0000ff
hi DiffText		gui=none			guifg=#ffffff
hi Folded						guifg=#5555aa
hi IncSearch		gui=underline
hi LineNr		gui=none			guifg=#444444
hi ErrorMsg		gui=none			guifg=#000000
hi Special		gui=none			guifg=#44aaff
hi ModeMsg 		gui=none			guifg=#bbbbbb
hi MoreMsg 		gui=none			guifg=#bbbbbb
hi NonText 		gui=none			guifg=#bbbbbb
hi Question 		gui=none			guifg=#bbbbbb
hi SpecialKey 		gui=none			guifg=#bbbbbb
hi StatusLine 		gui=none	guibg=#222222	guifg=#ffffff
hi StatusLineNC 	gui=none			guifg=#888888
hi Title						guifg=#ffffff
hi WarningMsg		gui=none
hi Underlined		gui=underline
hi Ignore						guifg=#777777
hi Error		gui=bold			guifg=#ff0044
hi Todo			gui=none	guibg=#aa0006	guifg=#bbbbbb
hi Operator		gui=none			guifg=#aaaaff
hi Function		gui=none			guifg=#777777
hi String		gui=none			guifg=#0077aa
hi Boolean						guifg=#0088bb
hi Pmenu		gui=none	guibg=#000000	guifg=#555555
hi PmenuSel		gui=none	guibg=#222222	guifg=#aaaaff



"vim: sw=8 noexpandtab

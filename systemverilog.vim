if exists("b:current_syntax")
    finish
endif

syn match   vLineComment "//.*" contains=NONE
syn region  vBlockComment start="/\*" end="\*/" contains=NONE

syn keyword vContinuous assign
syn keyword vProcedure initial always task endtask function endfunction
syn keyword vConstruct module endmodule generate endgenerate
syn keyword vBlock begin end fork join
syn keyword vConditional if else case casez casex endcase
syn keyword vRepeat forever repeat while for

syn match   vPreProc "`\(default_nettype\|define\|undef\|include\|timescale\)\>"
syn match   vPreCondit "`\(ifdef\|else\|elsif\|endif\|ifndef\)\>"

" automatic, signed?
syn keyword vNetType supply0 supply1 tri triand trior tri0 tri1 uwire wire wand wor none
syn keyword vDataType reg integer time
syn keyword vDirection input output inout
syn keyword vEdge posedge negedge edge

syn match   vOperator "[&|~><!*#%@+/=?}{\^\-]"
syn match   vDelimiter "[(){}\[\]:;]"

" note: ' cannot be start of word
syn match   vDecNumber "\(\<\d\+\|\)'[sS]\?[dD]\s*[0-9_xXzZ?]\+\>"
syn match   vDecNumber "\<[0-9_xXzZ?]\+\>"
syn match   vBinNumber "\(\<\d\+\|\)'[sS]\?[bB]\s*[0-1_xXzZ?]\+\>"
syn match   vOctNumber "\(\<\d\+\|\)'[sS]\?[oO]\s*[0-7_xXzZ?]\+\>"
syn match   vHexNumber "\(\<\d\+\|\)'[sS]\?[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"

syn keyword svProcedure always_comb always_latch always_ff final
syn keyword svBlock join_any join_none
syn keyword svConditional unique unique0 priority

syn keyword svDataType byte shortint int longint
syn keyword svDataType bit logic
syn keyword svDirection ref

syn match   svUnbased "'[01xXzZ]\>"

hi def link vLineComment Comment
hi def link vBlockComment Comment

hi def link vContinuous Statement
hi def link vProcedure Statement
hi def link vConstruct Keyword
hi def link vBlock Statement
hi def link vConditional Conditional
hi def link vRepeat Repeat

hi def link vPreProc PreProc
hi def link vPreCondit PreCondit

hi def link vNetType Type
hi def link vDataType Type
hi def link vDirection StorageClass
hi def link vEdge Keyword

hi def link vOperator Operator
hi def link vDelimiter Delimiter
hi def link vBinNumber Number
hi def link vOctNumber Number
hi def link vDecNumber Number
hi def link vHexNumber Number

hi def link svProcedure Statement
hi def link svBlock Statement
hi def link svConditional Conditional

hi def link svDataType Type
hi def link svDirection StorageClass

hi def link svUnbased Number

let b:current_syntax = "systemverilog"

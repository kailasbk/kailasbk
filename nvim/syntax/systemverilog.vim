if exists("b:current_syntax")
    finish
endif

"syn match   vIdentifier "[a-zA-z_][a-zA-z0-9_$]*"

" (System)Verilog features
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
syn keyword vSignedness signed unsigned
syn keyword vDirection input output inout
syn keyword vEdge posedge negedge edge

syn match   vOperator "[&|~><!*#%@+/=?}{\^\-]"
syn keyword vOperator or
syn match   vDelimiter "[(){}\[\]:;,.]"

" note: ' cannot be start of word
syn match   vDecNumber "\(\<\d\+\|\)'[sS]\?[dD]\s*[0-9_xXzZ?]\+\>"
syn match   vDecNumber "\<[0-9_xXzZ?]\+\>"
syn match   vBinNumber "\(\<\d\+\|\)'[sS]\?[bB]\s*[0-1_xXzZ?]\+\>"
syn match   vOctNumber "\(\<\d\+\|\)'[sS]\?[oO]\s*[0-7_xXzZ?]\+\>"
syn match   vHexNumber "\(\<\d\+\|\)'[sS]\?[hH]\s*[0-9a-fA-F_xXzZ?]\+\>"

syn region  vString start=+"+ skip=+\\"+ end=+"+ contains=vEscape,@Spell
syn match   vEscape +\\[nt"\\]+ contained
syn match   vEscape "\\\o\o\=\o\=" contained

syn match   vLineComment "//.*" contains=@Spell
syn region  vBlockComment start="/\*" end="\*/" contains=@Spell

" SystemVerilog features
syn keyword svProcedure always_comb always_latch always_ff final
syn keyword svConstruct program endprogram package endpackage clocking endclocking
syn keyword svConstruct class endclass
syn keyword svBlock join_any join_none
syn keyword svConditional unique unique0 priority

syn keyword svOperator new

syn keyword svTypedef typedef
syn keyword svDataType byte shortint int longint
syn keyword svDataType bit logic
syn keyword svStructure struct union enum
syn keyword svPacked packed
syn keyword svDirection ref

syn match   svUnbased "'[01xXzZ]\>"

" style additions
" syn match   styClass "\<\u\l*\>"
syn match   styType "\<[a-z_]*_t\>"
syn match   styStruct "\<\[a-z_]*_s\>"
syn match   styEnum "\<[a-z_]*_e\>"

hi def link vIdentifier Identifier

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
hi def link vSignedness StorageClass
hi def link vDirection StorageClass
hi def link vEdge Keyword

hi def link vOperator Operator
hi def link vDelimiter Delimiter

hi def link vBinNumber Number
hi def link vOctNumber Number
hi def link vDecNumber Number
hi def link vHexNumber Number

hi def link vString String
hi def link vEscape SpecialChar

hi def link vLineComment Comment
hi def link vBlockComment Comment

hi def link svProcedure Statement
hi def link svConstruct Statement
hi def link svBlock Statement
hi def link svConditional Conditional

hi def link svOperator Operator

hi def link svTypedef Typedef
hi def link svDataType Type
hi def link svStructure Structure
hi def link svPacked StorageClass
hi def link svDirection StorageClass

hi def link svUnbased Number

hi def link styType Type
hi def link styStruct Type
hi def link styEnum Type

let b:current_syntax = "systemverilog"

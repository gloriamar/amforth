; this dictionary contains optional words
; they may be moved to the core dictionary if needed
.include "dict_minimum.inc"

.include "words/1ms.asm"

.include "words/2literal.asm"
.include "words/2r_from.asm"
.include "words/spirw.asm"
.include "words/2spirw.asm"

.include "words/2to_r.asm"


.include "words/bm_clear.asm"
.include "words/bm_set.asm"
.include "words/bm_toggle.asm"
.include "words/bracketcompile.asm"
.include "words/built.asm"
.include "words/count.asm"
.include "words/d-equal.asm"

.include "words/do2literal.asm"





.include "words/fill.asm"
.include "words/find.asm"
.include "words/get-recognizer.asm"
.include "words/int-num.asm"
.include "words/ms.asm"
.include "words/n_r_from.asm"
.include "words/n_to_r.asm"
.include "words/nip.asm"
.include "words/no-jtag.asm"
.include "words/notequalzero.asm"
.include "words/pick.asm"
.include "words/place.asm"
.include "words/popcnt.asm"
.include "words/reg-a.asm"
.include "words/reg-b.asm"
.include "words/set-recognizer.asm"
.include "words/d-2star.asm"
.include "words/d-plus.asm"
.include "words/d-minus.asm"
.include "words/d-invert.asm"
.include "words/udot.asm"
.include "words/dot-s.asm"
.include "words/udotr.asm"
.include "words/uzerodotr.asm"
.include "words/dotstring.asm"
.include "words/squote.asm"
.include "words/wdr.asm"
.include "words/words.asm"
.include "words/word.asm"
.include "words/edefer.asm"
.include "words/rdefer.asm"
.include "words/is.asm"
.include "dict_compiler.inc"
.include "words/show-wordlist.asm"
.include "dict_interrupt.inc"

; include some controller specific definitions
.include "device.inc"

.include "words/applturnkey.asm"
.include "words/qmark.asm"

.include "dict_wl.inc"


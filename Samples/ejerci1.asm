


	output 	"ejerci1.bin"

	db #fe
	dw START
	dw END
	dw START

	org #8500

START:

	ld hl,(seed)        ; Pointer
	ld a,h
	and 31              ; keep it within first 8k of ROM.
	ld h,a
	ld a,(hl)           ; Get "random" number from location.
	inc hl              ; Increment pointer.
	ld (seed),hl
	ret
	
END:

seed:

	defw 0
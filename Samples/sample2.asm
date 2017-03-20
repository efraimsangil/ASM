


	output 	"sample2.bin"

	db #fe
	dw START
	dw END
	dw START

	org #8200

START:

	ld		hl,#0000			;posición de la memoria VRAM desde donde se va a copiar (origen)
	ld 		de,#8500			;posición de la memoria VRAM donde se va a dejar la copia (destino)
	ld		bc,#37ff			;cuantos bytes a copiar
	call	#0059				;llamada a la BIOS función LDIRMV
	ret
	
END:



	output 	"sample2b.bin"

	db #fe
	dw START
	dw END
	dw START

	org #8200

START:

	call	#0072				;Inicia SCREEN 2. Llamada a BIOS SETGRP
	ld		hl,#8500			;posición de la memoria VRAM desde donde se va a copiar (origen)
	ld 		de,#0000			;posición de la memoria VRAM donde se va a dejar la copia (destino)
	ld		bc,#37ff			;cuantos bytes a copiar
	call	#005C				;llamada a la BIOS función LDIRVM
	
	call 	#009F				;espera que se pulse una tecla. Llamada a BIOS CHGET
	
	ret							;vuelve a BASIC
	
END:
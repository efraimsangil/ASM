


	output 	"sample3.bin"

CHGET	equ		#009F
CHPUT	equ		#00A2			; escribe un carácter y avanza un posición
POSIT	equ		#00C6
	
	db #fe						; cabecera de ficheros que serán cargados con BLOAD desde BASIC
	dw START
	dw END
	dw START

	org #8200

START:
	
	call 	CHGET				;se queda aquí esperando a que se pulse una tecla
								; el código ASCII de la tecla se queda pulsada se guarda en el registro A
	cp 		'q'					;compara el valor contenido en el registro A con el código ASCII de la letra q (113)
	ret		z					; termina la rutina y vuelve al BASIC si la comparación ha sido valor de registro A igual a ASCII de 'q'
	
	ld		(ch_leido),a		;metemos en la posición de memoria ch_leido el valor del registro A (el ASCII de la tecla pulsada)
	
	;posicionamos el cursor
	
	ld 		a,(eje_y)
	ld 		h,a

	ld 		a,(eje_x)
	ld 		l,a

	;ld      l,1
	;ld		hl,(eje_Y)					;posición Y en registro H
	;ld		l,1						;posición X en registro L 
	call 	POSIT				;esta llamada a la BIOS es como un LOCATE de BASIC
	
	;inicializamos la variable contador
	ld		a,0					;ahora el registro A tiene el valor 0
	ld		(contador),a		;metemos en la variable contador el valor del registro A 
	
bucle:
	ld		a,(ch_leido)		;ahora A tiene el valor de la tecla pulsada
	call 	CHPUT				;imprime el caracter donde esté el cursor y avanza

	ld 		a,(contador)		;registro A tiene el valor actual del contador
	inc		a 					;a=a+1	
	ld 		(contador),a 		;volvemos a meter el valor de A en la variable contador
	cp 		40					;el valor de A es 40?
	ld 		a,(eje_y)
	add 	a,8
	ld 		(eje_y),a
	jp		nz,bucle			;comprueba el flag NZ (nozero) si es cero su valor salta al bucle, si es 1 (zero) no hace nada
	
	jp 		START				;vuelve al principio
	
END:

; DEFINICION DE VARIABLES
ch_leido	db		0
contador	db		0
eje_x		db		0
eje_y		db		0
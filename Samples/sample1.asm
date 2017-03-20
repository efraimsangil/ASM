


	output 	"sample1.bin"

	db #fe				;cabecera de ficheros que seran cargados con BLOAD desde BASIC
	dw START
	dw END
	dw START

	org #8500			;posición de memoria donde comienza el programa

START:

	ld	a,[#8600]		;cargo el byte de la posición de memoria #8600 en el registro A
	ld 	b,a				;cargo el byte contenido en A en el registro B 
	ld 	a,[#8601]		;cargo el byte de la posición de memoria #8601 en el registro A
	add a,b				;sumo el valor de A y el de B y lo dejo en el registro A
	ld	[#8602],a		;dejo el valor de A en la posición de memoria #8602
	
	ret					;vuelvo al BASIC

END:
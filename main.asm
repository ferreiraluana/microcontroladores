;
; tarefa2.asm
;
; Created: 30/10/2021 21:10:14
; Author : luana
;


.def counter = r17 ; define r17 como contador
.def temp = r16 ; define r16 como auxiliar

reset:
	ldi counter, 0x00 ; inicia o contador na posicao zero
	ldi temp, 0xFF ; define PORTB como saida
	out DDRB, temp
	ldi temp, 0x00 ; define PORTD como entrada
	out DDRD, temp

loop:
	in temp, PIND ; armazena o valor de PIND em r16
	cpi temp, 0x00 ; verifica se o valor lido eh zero 
	breq config_output ; caso seja zero, o botao nao esta pressionado
	inc counter ; caso contrario, o botao esta pressionado e o contador eh incrementado

config_output:
	out PORTB, counter ; transfere o valor de counter para a saida em PORTB
	rjmp loop ; reinicia o loop
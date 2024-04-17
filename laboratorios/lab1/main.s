	EXPORT Reset_Handler
	EXPORT __Vectors
		
	;the vector table 
	;(The followings will be stored in memory loc. starting from 0)
	AREA RESET, DATA, READONLY
__Vectors
	DCD	stack_init		;init locations 0 to 3 with stack space
	DCD	Reset_Handler	;store Reset_Handler into loc. 4 to 7

	; reserving 400 bytes of RAM for stack
	AREA STACK, DATA, READWRITE
	SPACE 400
stack_init

	AREA MY_STARTUP, CODE, READONLY
Reset_Handler	PROC
	LDR	R5,=__at5; alterar aqui para ir para outra atividade
	BX	R5		; go to __atn
	ENDP
		
	EXPORT __at1
	AREA EX1, CODE, READONLY
__at1	PROC
	MOV  R1,#0x12
	MOV  R2,#0x25
	ADD R3, R2, R1
	SUBS R3, R3, #0x7
HERE1 B HERE1
	ENDP
		
	AREA EX2, CODE, READONLY
__at2	PROC
	MOV R2, #2 ; R2 = 2
	MOV R3, #3 ; R3 = 3
	MOV R4, #5 ; R4 = 5
	ADD R5, R2, R3 ; R5 = 2 + 3
	ADD R5, R5, R4 ; R5 = 5 + 5 = 10
HERE2 B HERE2
	ENDP
		
	AREA EX3, CODE, READONLY
__at3	PROC
	MOV R2, #0x99
	MOV R0, R2
	MOV R1, R2
	MOV R3, R2
HERE3 B HERE3
	ENDP
		
	AREA EX4, CODE, READONLY
__at4	PROC
	LDR R0, =0x33322292
	LDR R1, =0x55566623
	LDR R2, =0x9998884B
	LDR R3, =0xFF
	LDR R4, =0xDDDEEE01
	ADDS R5, R0, R1 ; Z = 0, C = 0
	ADDS R5, R5, R2 ; Z = 0, C = 1
	ADDS R5, R5, R3 ; Z = 0, C = 0
	ADDS R5, R5, R4 ; Z = 1, C = 1
HERE4 B HERE4
	ENDP
				
	AREA EX5, CODE, READONLY
__at5	PROC
	MOV R1,#27
	MOV R2,#15
	SUBS R3, R1, R2 ; Z = 0, C = 1
	MOV R1,#20
	MOV R2,#15
	SUBS R3, R1, R2 ; Z = 0, C = 1
	MOV R1,#95
	MOV R2,#95
	SUBS R3, R1, R2 ; Z = 1, C = 1
	MOV R1,#50
	MOV R2,#70
	SUBS R3, R1, R2 ; Z = 0, c = 0
HERE5 B HERE5
	ENDP

	END

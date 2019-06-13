.data
array: .space 128
cant: .asciiz "Cantidad de numeros: "
entre: .asciiz "Entre numero ["
finentre: .asciiz "]: "
dif: .asciiz "Las diferencia de los cuadrados: "
fin: .asciiz "Fin del programa"


.text

main:

la $a0, cant #para imprimir el mensaje sobre la cantidad de numeros

li $v0, 4 #cargo indicador para imprimir
syscall

li $v0, 5 #pido cant de numeros
syscall
la $t2, array
move $t0, $v0 #guardo la cant de numeros en $t0
li $t1, 1 #pongo el registro $t1 en 1
move $t3, $t2 #cargo la direccion de $t2 en $t3 como comienzo de la lista
beq $t1, $t0, Fin
ForInput:
	
	bgt $t1, $t0, ExitInput #condicion de salida, si la cant de numeros ingresados es igual a la cant
 				#especificada por el user
	la $a0, entre #para imprimir el mensaje de la entrada del numero
	li $v0, 4
	syscall
	move $a0, $t1 #imprimir el "indicador" del numero que se esta pidiendo
	li $v0, 1
	syscall
	la $a0, finentre #mensaje del fin de la entrada de un numero
	li $v0, 4
	syscall	
	li $v0, 5 #llamada a ingreso de numero	
	syscall
	sw $v0, 0($t2)
	addi $t2, $t2, 4
	addi $t1, $t1, 1	
	j ForInput

ExitInput:
Fin:
li $v0, 10
syscall



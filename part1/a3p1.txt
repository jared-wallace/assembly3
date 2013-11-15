			.text
			.globl main
main:
########################################
# Register Usage
########################################
# $t0: used
# $t1: hopPtr1
# $t2: hopPtr2
# $t8: endPtr1
# $t9: endPtr2
# $t4: oneInt
# $t5: short-lived temporary
# $v1: reply
# $a2: min
# $a3: max
# $t3: hasDup
########################################
			addiu $sp, $sp, -1008
			li $t0, 0x756c6156
			sw $t0, 0($sp)
			li $t0, 0x73692065
			sw $t0, 4($sp)
			li $t0, 0x64646f20
			sw $t0, 8($sp)
			li $t0, 0x202e2e2e
			sw $t0, 12($sp)
			li $t0, 0x20646461
			sw $t0, 16($sp)
			li $t0, 0x6f742031
			sw $t0, 20($sp)
			li $t0, 0x65766520
			sw $t0, 24($sp)
			li $t0, 0x657a696e
			sw $t0, 28($sp)
			li $t0, 0x002e2e2e
			sw $t0, 32($sp)
			li $t0, 0x2078614d
			sw $t0, 36($sp)
			li $t0, 0x0020666f
			sw $t0, 40($sp)
			li $t0, 0x706e490a
			sw $t0, 44($sp)
			li $t0, 0x69207475
			sw $t0, 48($sp)
			li $t0, 0x2320746e
			sw $t0, 52($sp)
			li $t0, 0x00000000
			sw $t0, 56($sp)
			li $t0, 0x6c617620
			sw $t0, 60($sp)
			li $t0, 0x20736575
			sw $t0, 64($sp)
			li $t0, 0x65746e65
			sw $t0, 68($sp)
			li $t0, 0x2e646572
			sw $t0, 72($sp)
			li $t0, 0x00002e2e
			sw $t0, 76($sp)
			li $t0, 0x65746e45 
			sw $t0, 80($sp)
			li $t0, 0x6e612072
			sw $t0, 84($sp)
			li $t0, 0x6568746f
			sw $t0, 88($sp)
			li $t0, 0x28203f72
			sw $t0, 92($sp)
			li $t0, 0x726f206e
			sw $t0, 96($sp)
			li $t0, 0x3d204e20
			sw $t0, 100($sp)
			li $t0, 0x2c6f6e20
			sw $t0, 104($sp)
			li $t0, 0x796e6120
			sw $t0, 108($sp)
			li $t0, 0x6e696874
			sw $t0, 112($sp)
			li $t0, 0x6c652067
			sw $t0, 116($sp)
			li $t0, 0x3d206573
			sw $t0, 120($sp)
			li $t0, 0x73657920
			sw $t0, 124($sp)
			li $t0, 0x00002029
			sw $t0, 128($sp)
			li $t0, 0x6c617620
			sw $t0, 132($sp)
			li $t0, 0x73286575
			sw $t0, 136($sp)
			li $t0, 0x6e652029
			sw $t0, 140($sp)
			li $t0, 0x65726574
			sw $t0, 144($sp)
			li $t0, 0x00203a64
			sw $t0, 148($sp)
			li $t0, 0x206e694d
			sw $t0, 152($sp)
			li $t0, 0x00207369
			sw $t0, 156($sp)
			li $t0, 0x2078614d
			sw $t0, 160($sp)
			li $t0, 0x00207369
			sw $t0, 164($sp)
			li $t0, 0x206f6e55
			sw $t0, 168($sp)
			li $t0, 0x616d206f
			sw $t0, 172($sp)
			li $t0, 0x75642073
			sw $t0, 176($sp)
			li $t0, 0x63696c70
			sw $t0, 180($sp)
			li $t0, 0x73657461
			sw $t0, 184($sp)
			li $t0, 0x002e2e2e
			sw $t0, 188($sp)
			li $t0, 0x64206f4e
			sw $t0, 192($sp)
			li $t0, 0x696c7075
			sw $t0, 196($sp)
			li $t0, 0x65746163
			sw $t0, 200($sp)
			li $t0, 0x002e2e2e
			sw $t0, 204($sp)
			li $t0, 0x0000203a
			sw $t0, 248($sp)
			li $t0, 0
			addi $t1, $sp, 208
begDW1:
			li $v0, 4
			addi $a0, $sp, 44
			syscall
			li $v0, 1
			addi $a0, $t0, 1
			syscall
			li $v0, 4
			addi $a0, $sp, 248
			syscall
			
			li $v0, 5
			syscall
			move $t4, $v0
			andi $t5, $t4, 1
			beqz $t5, endI1
begI1:
			li $v0, 4
			move $a0, $sp
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			addi $t4, $t4, 1
endI1:
			sw $t4, 0($t1)
			addi $t0, $t0, 1
			addi, $t1, $t1, 4
			li $t5, 10
			bne $t0, $t5, else2
begI2:
			li $v0, 4
			addi $a0, $sp, 36
			syscall
			li $v0, 1
			li $a0, 10
			syscall
			li $v0, 4
			addi $a0, $sp, 60
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v1, 'n'
			j endI2
else2:
			li $v0, 4
			addi $a0, $sp, 80
			syscall
			li $v0, 12
			syscall
			move $v1, $v0
 endI2:

endDW1:
DWTest1:
			li $t5, 'n'
			beq $v1, $t5, xitDW1
			li $t5, 'N'
			bne $v1, $t5, begDW1
xitDW1:

			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0, 1
			move $a0, $t0
			syscall
			li $v0, 4
			addi $a0, $sp, 132
			syscall
			addi $t5, $sp, 208
			sll $t8, $t0, 2
			add $t8, $t8, $t5
			addi $t1, $sp, 208
			j FTest1
begF1:
			addi $t5, $t8, -4
			bge $t1, $t5, else3
begI3:
			li $v0, 1
			lw $a0, 0($t1)
			syscall
			li $v0, 11
			li $a0, ' '
			syscall
			syscall
			j endI3
else3:
			li $v0, 1
			lw $a0, 0($t1)
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
endI3:
			addi $t1, $t1, 4

FTest1:		blt $t1, $t8, begF1
endF1:
			addi $t1, $sp, 208
			sll $t8, $t0, 2
			add $t8, $t8, $t1

			lw $a2, 0($t1)
			move $a3, $a2
			addi $t1, $t1, 4
			j WTest1
begW1:
			lw $t5, 0($t1)
			bge $t5, $a2, else4
begI4:
			move $a2, $t5
			j endI4
else4:
			ble $t5, $a3, endI5
begI5:
			move $a3, $t5
endI5:
endI4:
			addi $t1, $t1, 4
WTest1:			blt $t1, $t8, begW1
endW1:

			li $v0, 4
			addi $a0, $sp, 152
			syscall
			li $v0, 1
			move $a0, $a2
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0, 4
			addi $a0, $sp, 160
			syscall
			li $v0, 1
			move $a0, $a3
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			li $t3, 0
			addi $t5, $sp, 208
			sll $t8, $t0, 2
			addi $t8, $t8, -4
			add $t8, $t8, $t5
			
			addi $t9, $t8, 4
			addi $t1, $sp, 208
			j FTest2
begF2:
			lw $t4, 0($t1)
			addi $t2, $t1, 4
			j FTest3
begF3:
			lw $t5, 0($t2)
			bne $t5, $t4, endI6
begI6:
			li $t3, 1
			j endF3
endI6:
			addi $t2, $t2, 4

FTest3:			blt $t2, $t9, begF3
endF3:

			addi $t1, $t1, 4

FTest2:			bnez $t3, xitF2
			blt $t1, $t8, begF2
xitF2:
endF2:

			beqz $t3, else7
begI7:
			li $v0, 4
			addi $a0, $sp, 168
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			j endI7
else7:
			li $v0, 4
			addi $a0, $sp, 192
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
endI7:

			addiu $sp, $sp, 1008
			li $v0, 10
			syscall


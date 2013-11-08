			.data
iArr:			.space 40			
iinPrompt:		.asciiz "\nInput int #"
colSpace:		.asciiz ": "
oveMsg:			.asciiz "Value is odd... add 1 to evenize..."
moMsg:			.asciiz "Max of "
veMsg:			.asciiz " values entered..."
eaPrompt:		.asciiz "Enter another? (n or N = no, anything else = yes) "
veLab:			.asciiz " value(s) entered: "
minLab:			.asciiz "Min is "
maxLab:			.asciiz "Max is "
hasDupMsg:		.asciiz "Uno o mas duplicates..."
noDupMsg:		.asciiz "No duplicate..."
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
			li $t0, 0
			la $t1, iArr
begDW1:
			li $v0, 4
			la $a0, iinPrompt
			syscall
			li $v0, 1
			addi $a0, $t0, 1
			syscall
			li $v0, 4
			la $a0, colSpace
			syscall
			
			li $v0, 5
			syscall
			move $t4, $v0
			andi $t5, $t4, 1
			beqz $t5, endI1
begI1:
			li $v0, 4
			la $a0, oveMsg
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
			la $a0, moMsg
			syscall
			li $v0, 1
			li $a0, 10
			syscall
			li $v0, 4
			la $a0, veMsg
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v1, 'n'
			j endI2
else2:
			li $v0, 4
			la $a0, eaPrompt
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
			la $a0, veLab
			syscall
			la $t5, iArr
			sll $t8, $t0, 2
			add $t8, $t8, $t5
			la $t1, iArr
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

FTest1:			blt $t1, $t8, begF1
endF1:

			la $t1, iArr
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
			la $a0, minLab
			syscall
			li $v0, 1
			move $a0, $a2
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			li $v0, 4
			la $a0, maxLab
			syscall
			li $v0, 1
			move $a0, $a3
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			li $t3, 0
			la $t5, iArr
			sll $t8, $t0, 2
			addi $t8, $t8, -4
			add $t8, $t8, $t5
			
			addi $t9, $t8, 4
 			la $t1, iArr
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
			la $a0, hasDupMsg
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
			j endI7
else7:
			li $v0, 4
			la $a0, noDupMsg
			syscall
			li $v0, 11
			li $a0, '\n'
			syscall
endI7:

			li $v0, 10
			syscall


#PURPOSE: Illustrate how functions work. Computes the value of:
# 2^3 + 5^2

.section .data
#Program Stores all in registers so data section empty

.section .text

.globl _start
_start:
pushl $3 #push second arg to stack
pushl $2 #push first arg to stack
call power
addl $8, %esp #Reset stack pointer
pushl %eax #Save the answer from the function call
pushl $2
pushl $5 #Push args for next function

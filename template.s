#PURPOSE: Template for ASM Programs
#
#INPUT: NONE
#
#OUTPUT: Returns status code and exits
#status code can be retreived by running echo $?
#
#VARIABLES:
# %eax - system call number
# %ebx - return value

.section .data

.section .text

.globl _start

_start:
movl $1, %eax 
movl $0, %ebx
int $0x80



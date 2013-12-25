#PURPOSE: Finds the max number from a set of data items.
#
#VARIABLES:
#%edi - Index of data being examined
#%ebx - Largest data item found
#%eax - Current data item
#
#MEMORY LOCATION:
#data_items - contains the item data. 0 is used to terminate. 

.section .data
data_items:
.long 3,67,34,222,45,75,54,34,44,33,22,11,66,0

.section .text

.globl _start
_start:
movl $0, %exi #Set up index. Starts at 0.
movl data_items(,%edi,4), %eax #Load the first byte of data from data_items.
movl %eax, %ebx #The first data item will always be the biggest

start_loop:
cmpl $0, %eax #Check if 0 was obtained. Check for end of data. 
je loop_exit #if eax is equal to 0 jump to loop exit
incl %edi #increment the index
movl data_items(,%edi,4), %eax #Load next data item into eax
cmpl %ebx, %eax #Compare biggest (ebx) to current (eax)
jle start_loop#if current is less than or equal to biggest restart loop
movl %eax, %ebx #Overwrite the largest value if reached
jmp start_loop #reset the loop

loop_exit:
#ebx holds the highest value. Will be returned as the status to the program
#because ebx is also where the status code is looked for
movl $1, %eax #1 is the exit syscall
int $0x80 #Call the kernel interrupt


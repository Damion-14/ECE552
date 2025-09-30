## Author: Damion Huppert
##
## You may implement the following with any of the instructions in the RV32I instruction set
## and described in the reference sheet. Do not use any of the mul[h][s][u] instructions which
## are *not* described in the reference sheet. Remember to respect the calling convention - if
## you choose to use any of the callee saved registers s[0-11], remember to save them to the
## stack before reusing them (note, you should not need to do this but are free to do so).
##
## [Description]
## Multiplies two 32-bit *unsigned* numbers and provides a 32-bit *unsigned* result
## consisting of the lower 32 bits of the product.
##
## [Arguments]
## a0 = multiplicand
## a1 = multiplier
##
## [Returns]
## a0 = 32-bit product
    .text
    .globl umul
umul:
    # This dummy code adds the two operands and returns the result.
    # Replace with your implementation.

    # ALG
    # if multiplier is 1 return multiplicand
    # if multiplier is 0 return 0
    # if multiplier is even divide multiplier by two (right shift 1) and multiply multiplicand by two
    # if multiplier is odd add multiplicand += multiplicand and subtract 1 from multiplier
    
    beq a1, x0, return_zero
    addi t1, x0, 1
    beq a1, t1, return_a0
    add t0, x0, x0 

loop:
    beq a1, x0, done
    andi t2, a1, 1 
    beq t2, x0, skip_add
    add t0, t0, a0

skip_add:
    slli a0, a0, 1
    srli a1, a1, 1
    bne a1, x0, loop
    
done: 
    add a0, t0, x0
    jalr x0, 0(ra)

return_zero:
    add a0, x0, x0
    jalr x0, 0(ra)
    
return_a0:
    jalr x0, 0(ra)

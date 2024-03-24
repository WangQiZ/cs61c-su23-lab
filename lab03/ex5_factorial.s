.globl factorial

.data
n: .word 9

.text
# Don't worry about understanding the code in main
# You'll learn more about function calls in lecture soon
main:
    la t0, n
    lw a0, 0(t0)
    jal ra, factorial

    addi a1, a0, 0
    addi a0, x0, 1
    ecall # Print Result

    addi a1, x0, '\n'
    addi a0, x0, 11
    ecall # Print newline

    addi a0, x0, 10
    ecall # Exit

# factorial takes one argument:
# a0 contains the number which we want to compute the factorial of
# The return value should be stored in a0
factorial:
    # YOUR CODE HERE
    add t0 x0 x0
    mv t0 a0 #t0 = n
    addi t1 x0 1#t1 = 1
    beq t0 x0 fzero#n = 0, a0 = 1 ret
    beq t0 t1 fzero
    fac:
    sub a0 a0 t1 #n-1
    mul t0 t0 a0
    bne a0 t1 fac
    mv a0 t0
    j fret
    fzero:
    mv a0 t1
    # This is how you return from a function. You'll learn more about this later.
    # This should be the last line in your program.
    fret:
    jr ra

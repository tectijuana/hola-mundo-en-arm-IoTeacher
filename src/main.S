    .section .data
msg:    .asciz "Hello World\n"

    .section .text
    .global _start

_start:
    // write(stdout=1, msg, len)
    mov     x8, #64          // syscall: write
    mov     x0, #1           // fd = 1 (stdout)
    ldr     x1, =msg         // buf
    mov     x2, #12          // len ("Hello World\n" = 12 bytes)
    svc     #0

    // exit(0)
    mov     x8, #93          // syscall: exit
    mov     x0, #0
    svc     #0

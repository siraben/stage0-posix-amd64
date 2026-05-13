.intel_syntax noprefix
.global _start
.text

_start:
    mov rbp, rsp

    # Prepare argv.
    lea rax, [rbp+8]
    push rax

    # Prepare envp.
    mov rax, rbp
    mov rax, [rax]
    add rax, 2
    sal rax, 3
    add rax, rbp
    push rax

    # Stack offset.
    add rbp, 8

    call FUNCTION_main

    mov rdi, rax
    mov rax, 0x3c
    syscall

section .data
    prompt1 db "Digite o primeiro número: ", 0
    prompt2 db "Digite o segundo número: ", 0
    prompt3 db "Digite a operação (+ - * /): ", 0
    fmt_in db "%lf", 0              ; "%lf" para double
    fmt_out db "Resultado: %f", 10, 0
    format_char db " %c", 0         ; espaço para ignorar newline

section .bss
    num1 resq 1
    num2 resq 1
    result resq 1
    op resb 1

section .text
    extern printf, scanf
    global main

main:
    ; ---------- Entrada do primeiro número ----------
    sub rsp, 8                     ; alinhamento da pilha
    mov rdi, prompt1
    call printf

    mov rdi, fmt_in
    mov rsi, num1
    call scanf

    ; ---------- Entrada do segundo número ----------
    mov rdi, prompt2
    call printf

    mov rdi, fmt_in
    mov rsi, num2
    call scanf

    ; ---------- Entrada da operação ----------
    mov rdi, prompt3
    call printf

    mov rdi, format_char
    mov rsi, op
    call scanf

    ; ---------- Lógica da operação ----------
    fld qword [num1]      ; ST(0) = num1
    fld qword [num2]      ; ST(0) = num2, ST(1) = num1

    mov al, byte [op]
    cmp al, '+'
    je soma
    cmp al, '-'
    je subtracao
    cmp al, '*'
    je multiplicacao
    cmp al, '/'
    je divisao
    jmp fim

soma:
    faddp st1, st0
    jmp armazenar

subtracao:
    fsubp st1, st0
    jmp armazenar

multiplicacao:
    fmulp st1, st0
    jmp armazenar

divisao:
    fdivp st1, st0
    jmp armazenar

armazenar:
    fstp qword [result]
    movq xmm0, [result]     ; mover double para xmm0 (usado por printf)
    mov rdi, fmt_out
    call printf
    add rsp, 8              ; desalinha a pilha usada no início

fim:
    ret
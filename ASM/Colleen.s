; 42 outside

global main
extern printf

section .text
main:
push rbx
lea rdi, [rel foo]
mov rsi, 10
mov rdx, 34
lea rcx, [rel foo]
call printf ; 42 inside
pop rsi
ret

foo:
db "; 42 outside%1$c%1$cglobal main%1$cextern printf%1$c%1$csection .text%1$cmain:%1$cpush rbx%1$clea rdi, [rel foo]%1$cmov rsi, 10%1$cmov rdx, 34%1$clea rcx, [rel foo]%1$ccall printf ; 42 inside%1$cpop rsi%1$cret%1$c%1$cfoo:%1$cdb %2$c%3$s%2$c, 0%1$c", 0

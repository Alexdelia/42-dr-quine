%define FT main
%define FILE "Grace_kid.s"
%define CODE "%%define FT main%1$c%%define FILE %2$cGrace_kid.s%2$c%1$c%%define CODE %2$c%3$s%2$c%1$c%1$csection .data%1$coutput:%1$cdb CODE, 0%1$cfile:%1$cdb FILE, 0%1$cfd:%1$cdq 0%1$c%1$csection .text%1$cglobal FT%1$cextern dprintf%1$c%1$cFT:%1$cpush rbp%1$cmov rbp, rsp%1$csub rsp, 16%1$cmov rdi, file%1$cmov rsi, 578%1$cmov rdx, 508%1$cmov rax, 2%1$csyscall%1$cmov [fd], rax%1$cmov rdi, [fd]%1$cmov rsi, output%1$cmov rdx, 10%1$cmov rcx, 34%1$cmov r8, output%1$ccall dprintf ; 42%1$cleave%1$cxor rax, rax%1$cmov rax, 60%1$cmov rdi, 0%1$csyscall%1$cret%1$c"

section .data
output:
db CODE, 0
file:
db FILE, 0
fd:
dq 0

section .text
global FT
extern dprintf

FT:
push rbp
mov rbp, rsp
sub rsp, 16
mov rdi, file
mov rsi, 578
mov rdx, 508
mov rax, 2
syscall
mov [fd], rax
mov rdi, [fd]
mov rsi, output
mov rdx, 10
mov rcx, 34
mov r8, output
call dprintf ; 42
leave
xor rax, rax
mov rax, 60
mov rdi, 0
syscall
ret

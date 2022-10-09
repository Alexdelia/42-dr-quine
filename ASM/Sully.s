global main

extern dprintf
extern sprintf
extern getenv
extern system

section .data
fd: dq 0
i: equ 5
in: dq 0
father: db "father", 0

s: db ".s", 0
o: db ".o", 0
e: db "", 0

name: times 512 db 0
exec: times 512 db 0
obj: times 512 db 0
final: times 1024 db 0
final_exe: times 1024 db 0

format: db "Sully_%d%s", 0

compile: db "nasm -f elf64 %1$s -o %2$s && gcc -no-pie -o %3$s %2$s", 0
launch: db "father=0 ./%1$s", 0

code: db "global main%3$c%3$cextern dprintf%3$cextern sprintf%3$cextern getenv%3$cextern system%3$c%3$csection .data%3$cfd: dq 0%3$ci: equ %5$d%3$cin: dq 0%3$cfather: db %2$cfather%2$c, 0%3$c%3$cs: db %2$c.s%2$c, 0%3$co: db %2$c.o%2$c, 0%3$ce: db %2$c%2$c, 0%3$c%3$cname: times 512 db 0%3$cexec: times 512 db 0%3$cobj: times 512 db 0%3$cfinal: times 1024 db 0%3$cfinal_exe: times 1024 db 0%3$c%3$cformat: db %2$cSully_%1$cd%1$cs%2$c, 0%3$c%3$ccompile: db %2$cnasm -f elf64 %1$c1$s -o %1$c2$s && gcc -no-pie -o %1$c3$s %1$c2$s%2$c, 0%3$claunch: db %2$cfather=0 ./%1$c1$s%2$c, 0%3$c%3$ccode: db %2$c%4$s%2$c, 0%3$c%3$csection .text%3$c%1$cmacro spf 4%3$cpop rax%3$cmov rdi, %1$c1%3$cmov rsi, %1$c2%3$cmov rdx, [%1$c3]%3$cmov rcx, %1$c4%3$cxor rax, rax%3$ccall sprintf%3$cpush rax%3$c%1$cendmacro%3$c%3$cmain:%3$cpush rbp%3$c%3$ccheck_i:%3$cmov rdi, father%3$ccall getenv%3$cmov r8, rax%3$cmov rax, i%3$cmov [in], rax%3$ccmp r8, 0%3$cje _name_file%3$ccall _dec_i%3$cret%3$c%3$c_dec_i:%3$cmov rax, i%3$cdec rax%3$cmov [in], rax%3$ccall _name_file%3$cret%3$c%3$c_name_file:%3$cpush rax%3$cspf name, format, in, s%3$cspf exec, format, in, e%3$cspf obj, format, in, o%3$cpop rax%3$cmov rdi, final%3$cmov rsi, compile%3$cmov rdx, name%3$cmov rcx, obj%3$cmov r8, exec%3$cxor rax, rax%3$ccall sprintf%3$cpush rax%3$ccall open_file%3$cret%3$c%3$copen_file:%3$cmov rdi, name%3$cxor rax, rax%3$cmov rsi, 578%3$cmov rdx, 508%3$cmov rax, 2%3$csyscall%3$cmov [fd], rax%3$ccall write_file%3$cret%3$c%3$cwrite_file:%3$cmov rdi, rax%3$cmov rsi, code%3$cmov rdx, 37%3$cmov rcx, 34%3$cmov r8, 10%3$cmov r9, code%3$cmov rax, [in]%3$cpush rax%3$cxor rax, rax%3$ccall dprintf%3$cpop rax%3$cpush rax%3$ccall _compile_launch%3$cret%3$c%3$c_compile_launch:%3$cpush rax%3$cmov rdi, final%3$ccall system%3$cpop rax%3$cpush rax%3$cmov rax, [in]%3$ccmp rax, 0%3$cje exit%3$cxor rax, rax%3$cmov rdi, final_exe%3$cmov rsi, launch%3$cmov rdx, exec%3$cxor rax, rax%3$ccall sprintf%3$cpop rax%3$cpush rax%3$cmov rdi, final_exe%3$ccall system%3$cpop rax%3$ccall exit%3$cret%3$c%3$cexit:%3$cmov rax, 60%3$cmov rdi, 0%3$csyscall%3$cret%3$c", 0

section .text
%macro spf 4
pop rax
mov rdi, %1
mov rsi, %2
mov rdx, [%3]
mov rcx, %4
xor rax, rax
call sprintf
push rax
%endmacro

main:
push rbp

check_i:
mov rdi, father
call getenv
mov r8, rax
mov rax, i
mov [in], rax
cmp r8, 0
je _name_file
call _dec_i
ret

_dec_i:
mov rax, i
dec rax
mov [in], rax
call _name_file
ret

_name_file:
push rax
spf name, format, in, s
spf exec, format, in, e
spf obj, format, in, o
pop rax
mov rdi, final
mov rsi, compile
mov rdx, name
mov rcx, obj
mov r8, exec
xor rax, rax
call sprintf
push rax
call open_file
ret

open_file:
mov rdi, name
xor rax, rax
mov rsi, 578
mov rdx, 508
mov rax, 2
syscall
mov [fd], rax
call write_file
ret

write_file:
mov rdi, rax
mov rsi, code
mov rdx, 37
mov rcx, 34
mov r8, 10
mov r9, code
mov rax, [in]
push rax
xor rax, rax
call dprintf
pop rax
push rax
call _compile_launch
ret

_compile_launch:
push rax
mov rdi, final
call system
pop rax
push rax
mov rax, [in]
cmp rax, 0
je exit
xor rax, rax
mov rdi, final_exe
mov rsi, launch
mov rdx, exec
xor rax, rax
call sprintf
pop rax
push rax
mov rdi, final_exe
call system
pop rax
call exit
ret

exit:
mov rax, 60
mov rdi, 0
syscall
ret

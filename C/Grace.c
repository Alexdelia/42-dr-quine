#include <stdio.h>

#define FILE	"Grace_kid.c"
#define CODE	"#include <stdio.h>%1$c%1$c#define FILE%2$c%3$c%4$s%3$c%1$c#define CODE%2$c%3$c%5$s%3$c%1$c#define FT()int main(void){fprintf(fopen(FILE, %3$cw%3$c), CODE, 10, 9, 34, FILE, CODE);}%1$c%1$cFT() // 42%1$c"
#define FT()int main(void){fprintf(fopen(FILE, "w"), CODE, 10, 9, 34, FILE, CODE);}

FT() // 42

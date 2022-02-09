#include <stdio.h>

// 42

char	*foo(void)
{
	return ("#include <stdio.h>%1$c%1$c// 42%1$c%1$cchar%2$c*foo(void)%1$c{%1$c%2$creturn (%3$c%4$s%3$c);%1$c}%1$c%1$cint%2$cmain(void)%1$c{%1$c%2$c// 42%1$c%2$cchar%2$c*a = foo();%1$c%2$cprintf(a, 10, 9, 34, a);%1$c}%1$c");
}

int	main(void)
{
	// 42
	char	*a = foo();
	printf(a, 10, 9, 34, a);
}

#include <stdio.h>

/*
	42 outside
*/

char	*foo(void)
{
	return ("#include <stdio.h>%1$c%1$c/*%1$c%2$c42 outside%1$c*/%1$c%1$cchar%2$c*foo(void)%1$c{%1$c%2$creturn (%3$c%4$s%3$c);%1$c}%1$c%1$cint%2$cmain(void)%1$c{%1$c%2$c/*%1$c%2$c%2$c42 inside%1$c%2$c*/%1$c%2$cchar%2$c*a = foo();%1$c%2$cprintf(a, 10, 9, 34, a);%1$c}%1$c");
}

int	main(void)
{
	/*
		42 inside
	*/
	char	*a = foo();
	printf(a, 10, 9, 34, a);
}

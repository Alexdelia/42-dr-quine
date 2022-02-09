#include <stdio.h>
// 42
char *foo(void)
{
	return "#include <stdio.h>%1%c";
}
int main(void)
{
	// 42
	char	*a = foo();
	printf(a, 10, 9, 34, a);
}

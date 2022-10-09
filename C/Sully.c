#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

#define CODE	"#include <stdio.h>%1$c#include <stdlib.h>%1$c#include <unistd.h>%1$c%1$c#define CODE%2$c%3$c%5$s%3$c%1$c%1$cint%2$cmain(void)%1$c{%1$c%2$cint%2$c%2$ci = %4$d;%1$c%2$cchar%2$cexe[16];%1$c%2$cchar%2$cfile[16];%1$c%2$cFILE%2$c*fd;%1$c%2$cchar%2$ccmd[100];%1$c%1$c%2$cif (i <= 0)%1$c%2$c%2$creturn (0);%1$c%2$cif (access(%3$cSully_5.c%3$c, R_OK) != -1)%1$c%2$c%2$ci--;%1$c%2$csprintf(file, %3$cSully_%%d.c%3$c, i);%1$c%2$csprintf(exe, %3$cSully_%%d%3$c, i);%1$c%2$cfd = fopen(file, %3$cw%3$c);%1$c%2$cfprintf(fd, CODE, 10, 9, 34, i, CODE);%1$c%2$cfclose(fd);%1$c%2$csprintf(cmd, %3$cclang %%s -o %%s && ./%%s%3$c, file, exe, exe);%1$c%2$csystem(cmd);%1$c%2$creturn (0);%1$c}%1$c"

int	main(void)
{
	int		i = 5;
	char	exe[16];
	char	file[16];
	FILE	*fd;
	char	cmd[100];

	if (i <= 0)
		return (0);
	if (access("Sully_5.c", R_OK) != -1)
		i--;
	sprintf(file, "Sully_%d.c", i);
	sprintf(exe, "Sully_%d", i);
	fd = fopen(file, "w");
	fprintf(fd, CODE, 10, 9, 34, i, CODE);
	fclose(fd);
	sprintf(cmd, "clang %s -o %s && ./%s", file, exe, exe);
	system(cmd);
	return (0);
}

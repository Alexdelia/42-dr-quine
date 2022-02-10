# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adelille <adelille@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/30 19:21:49 by adelille          #+#    #+#              #
#    Updated: 2022/02/09 16:18:35 by adelille         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

C_NAME =	Colleen
G_NAME =	Grace
S_NAME =	Sully

ASM =	nasm
CC = 	clang
RM = 	rm -rf

NFLAGS =	-f elf64

CFLAGS =	-Wall -Werror -Wextra
 CFLAGS +=	-g3
# CFLAGS +=	-fsanitize=address

# **************************************************************************** #
#	MAKEFILE	#

#MAKEFLAGS += --silent

SHELL := bash

B =		$(shell tput bold)
BLA =	$(shell tput setaf 0)
RED =	$(shell tput setaf 1)
GRE =	$(shell tput setaf 2)
YEL =	$(shell tput setaf 3)
BLU =	$(shell tput setaf 4)
MAG =	$(shell tput setaf 5)
CYA =	$(shell tput setaf 6)
WHI =	$(shell tput setaf 7)
D =		$(shell tput sgr0)
BEL =	$(shell tput bel)
CLR =	$(shell tput el 1)

# **************************************************************************** #
#	SRCS	#

C_SRC =	Colleen.s
G_SRC =	Grace.s
S_SRC =	Sully.s

C_OBJ =	Colleen.o
G_OBJ = Grace.o
S_OBJ = Sully.o

# *************************************************************************** #
#	RULES	#

all:	$(C_NAME) $(G_NAME) $(S_NAME)

test:	all
	./$(C_NAME) > tmp_$(C_NAME); diff tmp_$(C_NAME) $(C_NAME)
	./$(G_NAME) > tmp_$(G_NAME); diff tmp_$(G_NAME) $(G_NAME)
	./$(S_NAME) > tmp_$(S_NAME); diff tmp_$(S_NAME) $(S_NAME)

%.o: %.s
	$(ASM) $(NFLAGS) $< -o $@

$(C_NAME):	$(C_OBJ)
	$(CC) $(CFLAGS) $^ -o $@
$(G_NAME):	$(G_OBJ)
	$(CC) $(CFLAGS) $^ -o $@
$(S_NAME):	$(S_OBJ)
	$(CC) $(CFLAGS) $^ -o $@

clean:
	@$(RM) $(C_OBJ) $(G_OBJ) $(S_OBJ)

fclean:	clean
	@$(RM) $(C_NAME) $(G_NAME) $(S_NAME) tmp_*

re:		fclean all

.PHONY: all clean fclean re test

# **************************************************************************** #
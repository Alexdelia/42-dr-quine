# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: adelille <adelille@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/11/30 19:21:49 by adelille          #+#    #+#              #
#    Updated: 2022/10/09 11:38:31 by adelille         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

C_NAME =	Colleen
G_NAME =	Grace
S_NAME =	Sully

PY = 	python3
RM = 	rm -rf

SHELL := bash

# **************************************************************************** #
#	SRCS	#

C_SRC =	Colleen.py
G_SRC =	Grace.py
S_SRC =	Sully.py

G_KID =	Grace_kid.py

# *************************************************************************** #
#	RULES	#

all:	$(C_NAME) $(G_NAME) $(S_NAME)

test:	re
	./$(C_NAME) > tmp_$(C_SRC); diff tmp_$(C_SRC) $(C_SRC)
	./$(G_NAME); diff $(G_KID) $(G_SRC)
	./$(S_NAME); diff $(S_SRC) $(S_NAME)_5.py
	ls -l | grep "$(S_NAME)_" | wc -l > tmp_$(S_SRC)
	echo "6" > tmp_diff; diff tmp_$(S_SRC) tmp_diff

$(C_NAME):	$(C_SRC)
	cp $^ $@
$(G_NAME):	$(G_SRC)
	cp $^ $@
$(S_NAME):	$(S_SRC)
	cp $^ $@

clean:
	@$(RM) $(C_NAME) $(G_NAME) $(S_NAME) $(G_KID)

fclean:	clean
	@$(RM) $(C_NAME) $(G_NAME) $(S_NAME) tmp_* $(G_KID) Sully_*

re:		fclean all

.PHONY: all clean fclean re test

# **************************************************************************** #

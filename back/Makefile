##
## Gen me a passwd
## Makefile
## File description:
## Makefile for a password generator api
##

SRC	=	server.dart

NAME	=	server

all:	$(NAME)

$(NAME):	$(SRC)
	dart compile exe $(SRC) -o $(NAME)

dev:
	dart run $(SRC)

go:
	./$(NAME)

clean_me:
	find -name $(NAME) -delete
	find -name $(NAME).exe -delete
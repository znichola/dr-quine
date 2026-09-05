
CC=gcc

all: Colleen

clean:
	-rm Colleen.o

fclean: clean
	-rm Colleen

re: fclean all

Colleen: Colleen.o
	gcc $< -o $@

test: Colleen
	./$< | diff $<.c -

PHONY: all clean fclean re test

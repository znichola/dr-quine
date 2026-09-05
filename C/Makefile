CC=gcc
CFLAGS=-Wall -Wextra -Werror

PROGRAMS=Colleen Grace

all: $(PROGRAMS)

clean:
	-rm Colleen.o Grace.o

fclean: clean
	-rm $(PROGRAMS)

re: fclean all

$(PROGRAMS): %: %.o
	gcc $(CFLAGS) $< -o $@

tc: Colleen
	./$< | diff $<.c -

tg: Grace
	./$< | diff $<.c $<_kid.c

PHONY: all clean fclean re tc


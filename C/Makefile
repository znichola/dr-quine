CC=gcc
CFLAGS=-Wall -Wextra -Werror

PROGRAMS=Colleen Grace Sully

all: $(PROGRAMS)

clean:
	-rm Colleen.o Grace.o Sully.o
	-rm Grace_kid.c Sully_*.c

fclean: clean
	-rm $(PROGRAMS)

re: fclean all

$(PROGRAMS): %: %.o
	gcc $(CFLAGS) $< -o $@

tc: Colleen
	./$< | diff $<.c -

tg: Grace
	./$< | diff $<.c $<_kid.c

ts: Sully
	./$<
	./$< | diff $<.c $<_5.c

PHONY: all clean fclean re tc


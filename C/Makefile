CC=gcc
CFLAGS=-Wall -Wextra -Werror

PROGRAMS=Colleen Grace Sully

all: $(PROGRAMS)

clean:
	-rm Colleen.o Grace.o Sully.o
	-rm Grace_kid.c Sully_*
	-rm -r tmp

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
	-rm -r tmp
	-mkdir tmp
	cd tmp && gcc ../$<.c -o $< && ./$<
	cd tmp && ls -al | grep $<| wc -l
	-cd tmp && diff ../$<.c $<_0.c
	-cd tmp && diff $<_3.c $<_2.c
	-cd tmp && diff ../$<.c $<_4.c
	ls tmp


.PHONY: all clean fclean re tc tg ts


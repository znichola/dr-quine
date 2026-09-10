CC=gcc
CFLAGS=-Wall -Wextra -Werror

PROGRAMS=Colleen Grace Sully

all: $(PROGRAMS)

clean:
	-rm Colleen.o Grace.o Sully.o
	-rm Grace_kid.s Sully_*
	-rm -r tmp

fclean: clean
	-rm $(PROGRAMS)

re: fclean all

%.o: %.s
	nasm -f elf64 $< -o $@

$(PROGRAMS): %: %.o
	$(CC) $(CFLAGS) $< -o $@

tc: Colleen
	./$< | diff $<.s -

tg: Grace
	./$< | diff $<.s $<_kid.s

ts: Sully
	-rm -r tmp
	-mkdir tmp
	cp Sully tmp && cd tmp && ./$<
	cd tmp && ls -al | grep $<| wc -l
	-cd tmp && diff ../$<.s $<_0.s
	-cd tmp && diff $<_3.s $<_2.s
	-cd tmp && diff ../$<.s $<_4.s
	ls tmp

convert: Sully.s convert.js
	node convert.js $< > tmp.s
	mv tmp.s $<

.PHONY: all clean fclean re tc tg ts

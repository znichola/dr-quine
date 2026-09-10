
PROGRAMS=Colleen Grace Sully

all: $(PROGRAMS)

clean:
	-rm Sully_*.js
	-rm Grace_kid.js
	-rm -r tmp

fclean: clean

re: fclean all

$(PROGRAMS): %: %.js
	node $<

tc: Colleen.js
	node $< | diff $< -

tg: Grace.js
	node $< && diff $< Grace_kid.js

ts: Sully.js
	-rm -r tmp
	-mkdir tmp
	cd tmp && node ../$<
	cd tmp && ls -al | grep Sully | wc -l
	-cd tmp && diff ../$< Sully_0.js
	-cd tmp && diff Sully_3.js Sully_2.js
	-cd tmp && diff ../$< Sully_4.js
	ls tmp

.PHONY: all clean fclean re $(PROGRAMS) tc tg ts

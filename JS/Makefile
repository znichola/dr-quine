
PROGRAMS=Colleen

all: $(PROGRAMS)

clean:

fclean: clean

re: fclean all

$(PROGRAMS): %: %.js
	node $<

tc: Colleen.js
	node $< | diff $< -

tg: Grace.js
	node $< && diff $< Grace_kid.js

.PHONY: all clean fclean re tc $(PROGRAMS)

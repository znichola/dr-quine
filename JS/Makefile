
PROGRAMS=Colleen

all: $(PROGRAMS)

clean:

fclean: clean

re: fclean all

$(PROGRAMS): %: %.js
	node $<

tc: Colleen.js
	node $< | diff $< -

.PHONY: all clean fclean re tc $(PROGRAMS)

all: Colleen

%.o: %.s
	nasm -f elf64 $< -o $@

Colleen: Colleen.o
	gcc $< -o $@

ts: Colleen
	./Colleen | diff Colleen.s -

clean:
	-rm Colleen Colleen.o

fclean: clean

re: fclean all

.PHONY: all clean fclean re

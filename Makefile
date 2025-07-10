CC=gcc
CFLAGS=-MMD -Werror -Wall -Wextra -pedantic

SRC=$(wildcard src/*.c)
OBJ=$(SRC:%.c=%.o)
DEP=$(OBJ:%.o=%.d)

EXE=SHA256
LIBS=$(addprefix -l,)

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<

$(EXE): $(OBJ)
	$(CC) -o $@ $^ $(LIBS)

debug: CFLAGS += -g
debug: $(EXE)

release: CFLAGS += -O3 -DNDEBUG
release: $(EXE)
.NOTPARALLEL: release

all: $(EXE)

clean:
	rm -rf $(OBJ) $(DEP)

fclean: clean
	rm -f $(EXE)

re: fclean all
.NOTPARALLEL: re

.PHONY=debug release all clean fclean re

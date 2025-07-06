PROJ_NAME = wgirl

SRCDIR = ./src
INCDIR = ./include
OBJDIR = ./obj
BINDIR = ./bin

CC=clang
CFLAGS=-I. -Wpedantic -Wall -Wextra -g

SRC = $(wildcard $(SRCDIR)/*.c)
OBJ = $(patsubst $(SRCDIR)/%,$(OBJDIR)/%,$(SRC:.c=.o))


all: $(BINDIR)/wgirl

$(BINDIR)/wgirl: $(OBJ)
	$(CC) -o $@ $^ $(CFLAGS)

$(OBJDIR)/%.o: $(SRCDIR)/%.c $(SRCDIR)/%.h
	$(CC) -c -o $@ $< $(CFLAGS)

run: all
	@$(BINDIR)/wgirl

.PHONY: clean
clean: 
	rm -rf $(BINDIR)/* $(OBJDIR)/*

CC := gcc
FLAGS := -std=gnu99 -Wall -Werror
OUT := 1.out 2.out 2_1.out 3.out

%.out: %.c
	$(CC) $(FLAGS) -o $@ $<

all: $(OUT)

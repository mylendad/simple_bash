CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra
LISTFLAGS=-save-temps -H
LDFLAGS=-g 
MATHFLAG=-lm
TARGET=main
SHELL:=/bin/bash
FILE=test.txt test_2.txt
CHECK=2>&1 valgrind --tool=memcheck --leak-check=yes
.PHONY: all cat_run clean

all: clean cat_run tests

s21_grep:
		$(CC)  $(CFLAGS) test_grep.c grep.c $(LDFLAGS) -o grep.out

tests:
		
		# $(CHECK) ./cat.out $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -n $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -e $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -s $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -b $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -t $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -tnesb $(FILE) | grep ERROR

clean: 
		rm *.out

leaks_linux:
		valgrind --tool=memcheck --leak-check=yes ./grap.out

leaks_mac_os:
		leaks -atExit -- ./grap.out


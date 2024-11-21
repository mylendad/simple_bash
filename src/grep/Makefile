CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra
LDFLAGS=-g 
MATHFLAG=-lm
TARGET=main
SHELL:=/bin/bash
FILE=test.txt test_2.txt
CHECK=2>&1 valgrind --tool=memcheck --leak-check=yes

all: clean s21_grep tests


s21_grep:
		$(CC)  $(CFLAGS) test_grep.c grep.c $(LDFLAGS) -o s21_grep

tests:
		
		# $(CHECK) ./cat.out $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -n $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -e $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -s $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -b $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -t $(FILE) | grep ERROR
		# $(CHECK) ./cat.out -tnesb $(FILE) | grep ERROR

clean: 
		rm s21_grep

leaks_linux:
		valgrind --tool=memcheck --leak-check=yes ./s21_grep

leaks_mac_os:
		leaks -atExit -- ./s21_grep


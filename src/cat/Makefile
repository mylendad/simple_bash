CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra
LDFLAGS=-g
MATHFLAG=-lm
TARGET=main
SHELL:=/bin/bash
FILE=test.txt test_2.txt
CHECK=2>&1 valgrind --tool=memcheck --leak-check=yes
.PHONY: all cat_run clean

all: clean cat_run tests

s21_cat:
		$(CC)  $(CFLAGS) test_cat.c cat.c $(LDFLAGS) -o s21_cat

tests:
		@diff <(./cat.out $(FILE)) <(cat $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		@diff <(./cat.out -e $(FILE)) <(cat -e $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		@diff <(./cat.out -n $(FILE)) <(cat -n $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# @diff <(./cat.out -b $(FILE)) <(cat -b $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# @diff <(./cat.out -s $(FILE)) <(cat -s $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# @diff <(./cat.out -t $(FILE)) <(cat -t $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# @diff <(./cat.out --number-nonblank $(FILE)) <(cat -b $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# @diff <(./cat.out --number $(FILE)) <(cat -n $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# @diff <(./cat.out --squeeze-blank $(FILE)) <(cat -s $(FILE)) && echo "SUCCES!" || echo "FAIL!"

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
		valgrind --tool=memcheck --leak-check=yes ./cat.out

leaks_mac_os:
		leaks -atExit -- ./cat.out


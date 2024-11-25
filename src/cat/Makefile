CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra
LDFLAGS=-g
MATHFLAG=-lm
TARGET=main
SHELL:=/bin/bash
FILE=test.txt test_2.txt
CHECK=2>&1 valgrind --tool=memcheck --leak-check=yes
.PHONY: all cat_run clean

all: clean 21_cat tests
		$(CC)  $(CFLAGS) test_cat.c cat.c $(LDFLAGS) -o s21_cat

tests:
		diff <(./s21_cat $(FILE)) <(cat $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_cat -e $(FILE)) <(cat -e $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_cat -n $(FILE)) <(cat -n $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		
		diff <(./s21_cat -b $(FILE)) <(cat -b $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		
		diff <(./s21_cat -s $(FILE)) <(cat -s $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		
		diff <(./s21_cat -t $(FILE)) <(cat -t $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		
		diff <(./s21_cat --number-nonblank $(FILE)) <(cat -b $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		
		diff <(./s21_cat --number $(FILE)) <(cat -n $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		
		diff <(./s21_cat --squeeze-blank $(FILE)) <(cat -s $(FILE)) && echo "SUCCES!" || echo "FAIL!"

		# $(CHECK) ./s21_cat $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -n $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -e $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -s $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -b $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -t $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -tnesb $(FILE) | grep ERROR

clean: 
		rm s21_cat

leaks_linux:
		valgrind --tool=memcheck --leak-check=yes ./s21_cat

leaks_mac_os:
		leaks -atExit -- ./s21_cat


CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra
LDFLAGS=-g
MATHFLAG=-lm
TARGET=main
SHELL:=/bin/bash
FILE=test.txt
CHECK=2>&1 valgrind --tool=memcheck --leak-check=yes
.PHONY: all cat_run clean

all: clean cat_run tests

cat_run:
		$(CC)  $(CFLAGS) test_cat.c cat.c $(LDFLAGS) -o s21_cat.out

tests:
		diff <(./s21_cat.out $(FILE)) <(cat $(FILE))
		if [ $? -eq 0 ]; then
			echo "SUCCES!"
		else 
			echo "FAIL!"
		fi
		# -diff <(./s21_cat.out -e $(FILE)) <(cat -e $(FILE))
		# -diff <(./s21_cat.out -n $(FILE)) <(cat -n $(FILE))
		# -diff <(./s21_cat.out -b $(FILE)) <(cat -b $(FILE))
		# -diff <(./s21_cat.outs -s $(FILE)) <(cat -s $(FILE))
		# -diff <(./s21_cat.out -t $(FILE)) <(cat -t $(FILE))
		# -diff <(./s21_cat.out --number-nonblank $(FILE)) <(cat -b $(FILE))
		# -diff <(./s21_cat.out --number $(FILE)) <(cat -n $(FILE))
		# -diff <(./s21_can --squeeze-blank $(FILE)) <(cat -s $(FILE))
		# -diff <(./s21_cat.out -etsnb $(FILE)) <(cat -etsnb $(FILE))

		# $(CHECK) ./s21_cat.out $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat.out -n $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat.out -e $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat.out -s $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat.out -b $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat.out -t $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat.out -tnesb $(FILE) | grep ERROR

clean: 
		rm *.out

leaks_linux:
		valgrind --tool=memcheck --leak-check=yes ./s21_cat.out

leaks_mac_os:
		leaks -atExit -- ./s21_cat.out


CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra -g 
LDFLAGS=-g
MATHFLAG=-lm
TARGET=main
SHELL:=/bin/bash
FILE=test.txt
CHECK=2>&1 valgrind --tool=memcheck --leak-check=yes
PREF_DIR=../build
.PHONY: all cat clean

all: 

s21_cat:
		$(CC)  $(CFLAGS) test_cat.c cat.c $(LDFLAGS) -o s21_cat

tests:
		-diff <(./s21_cat $(FILE)) <(cat $(FILE))
		-diff <(./s21_cate -e $(FILE)) <(cat -e $(FILE))
		# -diff <(./s21_cat -n $(FILE)) <(cat -n $(FILE))
		# -diff <(./s21_cat -b $(FILE)) <(cat -b $(FILE))
		# -diff <(./s21_cats -s $(FILE)) <(cat -s $(FILE))
		# -diff <(./s21_cat -t $(FILE)) <(cat -t $(FILE))
		# -diff <(./s21_cat --number-nonblank $(FILE)) <(cat -b $(FILE))
		# -diff <(./s21_cat --number $(FILE)) <(cat -n $(FILE))
		# -diff <(./s21_can --squeeze-blank $(FILE)) <(cat -s $(FILE))
		# -diff <(./s21_cat -etsnb $(FILE)) <(cat -etsnb $(FILE))

		# $(CHECK) ./s21_cat $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -n $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -e $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -s $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -b $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -t $(FILE) | grep ERROR
		# $(CHECK) ./s21_cat -tnesb $(FILE) | grep ERROR

clean: 
		rm ../build/* 

leaks_linux:
		valgrind --tool=memcheck --leak-check=yes ./s21_cat

leaks_mac_os:
		leaks -atExit -- ./s21_cat


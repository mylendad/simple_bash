CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra -g 
LDFLAGS=-g
MATHFLAG=-lm
TARGET=main
PREF_DIR=../build
.PHONY: all cat clean

all: 

cat:
		$(CC)  $(CFLAGS) test_cat.c cat.c $(LDFLAGS) -o test


clean: 
		rm ../build/* 

leaks:
		valgrind --tool=memcheck --leak-check=yes

cppch:
		cppcheck --enable=all --suppress=missingIncludeSystem /home/mylendad/



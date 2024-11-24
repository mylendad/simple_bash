CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra
LDFLAGS=-g 
MATHFLAG=-lm
TARGET=main
SHELL:=/bin/bash
FILE=./test_0_grep.txt test_1_grep.txt test_2_grep.txt test_3_grep.txt test_4_grep.txt test_5_grep.txt test_6_grep.txt
CHECK=2>&1 valgrind --tool=memcheck --leak-check=yes

all: clean s21_grep tests


s21_grep:
		$(CC)  $(CFLAGS) test_grep.c grep.c $(LDFLAGS) -o s21_grep

tests:

		diff <(./s21_grep $(FILE)) <(grep $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -e $(FILE)) <(grep -e $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -n $(FILE)) <(grep -n $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -b $(FILE)) <(grep -b $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -s $(FILE)) <(grep -s $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -i $(FILE)) <(grep -i $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -v $(FILE)) <(grep -v $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -c $(FILE)) <(grep -c $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -l $(FILE)) <(grep -l $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -h $(FILE)) <(grep -h $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -f $(FILE)) <(grep -f $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -o $(FILE)) <(grep -o $(FILE)) && echo "SUCCES!" || echo "FAIL!"
	
		
		# $(CHECK) ./s21_grep $(FILE) | grep ERROR
		# $(CHECK) ./s21_grep -n $(FILE) | grep ERROR
		# $(CHECK) ./s21_grep -e $(FILE) | grep ERROR
		# $(CHECK) ./s21_grep -s $(FILE) | grep ERROR
		# $(CHECK) ./s21_grep -b $(FILE) | grep ERROR
		# $(CHECK) ./s21_grep -t $(FILE) | grep ERROR
		# $(CHECK) ./s21_grep -tnesb $(FILE) | grep ERROR

clean: 
		rm s21_grep

leaks_linux:
		valgrind --tool=memcheck --leak-check=yes ./s21_grep

leaks_mac_os:
		leaks -atExit -- ./s21_grep


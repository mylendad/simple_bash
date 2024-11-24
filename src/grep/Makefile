CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra
LDFLAGS=-g 
MATHFLAG=-lm
TARGET=main
SHELL:=/bin/bash
FILE=./test_files/test.txt ./test_files/test_0_grep.txt ./test_files/test_1_grep.txt ./test_files/test_2_grep.txt ./test_files/test_3_grep.txt ./test_files/test_4_grep.txt ./test_files/test_5_grep.txt ./test_files/test_6_grep.txt
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
		diff <(./s21_grep -f pattern.txt $(FILE)) <(grep -f pattern.txt $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -o $(FILE)) <(grep -o $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -vf $(FILE)) <(grep -vf $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -oo $(FILE)) <(grep -oo $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -os $(FILE)) <(grep -os $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -oh $(FILE)) <(grep -oh $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -on $(FILE)) <(grep -on $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -ol $(FILE)) <(grep -ol $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -in $(FILE)) <(grep -in $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -is $(FILE)) <(grep -is $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -io $(FILE)) <(grep -io $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		diff <(./s21_grep -iv $(FILE)) <(grep -iv $(FILE)) && echo "SUCCES!" || echo "FAIL!"
	
		
		$(CHECK) ./s21_grep $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -n $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -e $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -s $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -b $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -l $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -h $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -f $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -o $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -v $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -i $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -iv $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -io $(FILE) | grep ERROR
		$(CHECK) ./s21_grep -in $(FILE) | grep ERROR

clean: 
		rm s21_grep

leaks_linux:
		valgrind --tool=memcheck --leak-check=yes ./s21_grep

leaks_mac_os:
		leaks -atExit -- ./s21_grep


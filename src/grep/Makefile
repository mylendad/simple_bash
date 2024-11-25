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


clean: 
		rm s21_grep


leaks_linux:
		valgrind --tool=memcheck --leak-check=yes ./s21_grep


leaks_mac_os:
		leaks -atExit -- ./s21_grep


tests:

		# diff <(./s21_grep $(FILE)) <(grep $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -e $(FILE)) <(grep -e $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -n $(FILE)) <(grep -n $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -s $(FILE)) <(grep -s $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -i $(FILE)) <(grep -i $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -v $(FILE)) <(grep -v $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -c $(FILE)) <(grep -c $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -l $(FILE)) <(grep -l $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -h $(FILE)) <(grep -h $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -f pattern.txt $(FILE)) <(grep -f pattern.txt $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -o $(FILE)) <(grep -o $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -ei $(FILE)) <(grep -ei $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -ev $(FILE)) <(grep -ev $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -ec $(FILE)) <(grep -ec $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -el $(FILE)) <(grep -el $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -en $(FILE)) <(grep -en $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -eh $(FILE)) <(grep -eh $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -es $(FILE)) <(grep -es $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -ef $(FILE)) <(grep -ef $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -eo $(FILE)) <(grep -eo $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -vc $(FILE)) <(grep -vc $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -vl $(FILE)) <(grep -vl $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -vn $(FILE)) <(grep -vn $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -vh $(FILE)) <(grep -vh $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -vs $(FILE)) <(grep -vs $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -vf $(FILE)) <(grep -vf $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -vo $(FILE)) <(grep -vo $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -cl $(FILE)) <(grep -cl $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -cn $(FILE)) <(grep -cn $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -ch $(FILE)) <(grep -ch $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -cs $(FILE)) <(grep -cs $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -cf $(FILE)) <(grep -cf $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -co $(FILE)) <(grep -co $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -ln $(FILE)) <(grep -ln $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -lh $(FILE)) <(grep -lh $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -ls $(FILE)) <(grep -ls $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -lf $(FILE)) <(grep -lf $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -lo $(FILE)) <(grep -lo $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -nh $(FILE)) <(grep -nh $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -ns $(FILE)) <(grep -ns $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -nf $(FILE)) <(grep -nf $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -no $(FILE)) <(grep -no $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -hs $(FILE)) <(grep -hs $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -hf $(FILE)) <(grep -hf $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -ho $(FILE)) <(grep -ho $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -sf $(FILE)) <(grep -sf $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -so $(FILE)) <(grep -so $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		# diff <(./s21_grep -fo $(FILE)) <(grep -fo $(FILE)) && echo "SUCCES!" || echo "FAIL!"
		
	
		
		# $(CHECK) ./s21_grep -ei $(FILE)
		# $(CHECK) ./s21_grep -ev $(FILE)
		# $(CHECK) ./s21_grep -ec $(FILE)
		# $(CHECK) ./s21_grep -el $(FILE)
		# $(CHECK) ./s21_grep -en $(FILE)
		# $(CHECK) ./s21_grep -eh $(FILE)
		# $(CHECK) ./s21_grep -es $(FILE)
		# $(CHECK) ./s21_grep -ef $(FILE)
		# $(CHECK) ./s21_grep -eo $(FILE)
		# $(CHECK) ./s21_grep -vc $(FILE)
		# $(CHECK) ./s21_grep -vl $(FILE)
		# $(CHECK) ./s21_grep -vn $(FILE)
		# $(CHECK) ./s21_grep -vh $(FILE)
		# $(CHECK) ./s21_grep -vs $(FILE)
		$(CHECK) ./s21_grep -vf pattern.txt $(FILE)
		# $(CHECK) ./s21_grep -vo $(FILE)
		# $(CHECK) ./s21_grep -cl $(FILE)
		# $(CHECK) ./s21_grep -cn $(FILE)
		# $(CHECK) ./s21_grep -ch $(FILE)
		# $(CHECK) ./s21_grep -cs $(FILE)
		# $(CHECK) ./s21_grep -cf $(FILE)
		# $(CHECK) ./s21_grep -co $(FILE)
		# $(CHECK) ./s21_grep -ln $(FILE)
		# $(CHECK) ./s21_grep -lh $(FILE)
		# $(CHECK) ./s21_grep -ls $(FILE)
		# $(CHECK) ./s21_grep -lf $(FILE)
		# $(CHECK) ./s21_grep -lo $(FILE)
		# $(CHECK) ./s21_grep -nh $(FILE)
		# $(CHECK) ./s21_grep -ns $(FILE)
		# $(CHECK) ./s21_grep -nf $(FILE)
		# $(CHECK) ./s21_grep -no $(FILE)
		# $(CHECK) ./s21_grep -hs $(FILE)
		# $(CHECK) ./s21_grep -hf $(FILE)
		# $(CHECK) ./s21_grep -ho $(FILE)
		# $(CHECK) ./s21_grep -sf $(FILE)
		# $(CHECK) ./s21_grep -so $(FILE)
		# $(CHECK) ./s21_grep -fo $(FILE)



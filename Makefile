CC=gcc
CFLAGS=-std=c11 -Wall -Werror -Wextra
LDFLAGS=-g
SHELL:=/bin/bash

CAT_DIR=src/cat
GREP_DIR=src/grep
TESTS_DIR=tests

.PHONY: all tests clean rebuild leaks_linux leaks_mac_os

all: s21_cat s21_grep

s21_cat: $(CAT_DIR)/cat.c $(CAT_DIR)/cat.h $(CAT_DIR)/test_cat.c
	$(CC) $(CFLAGS) $(CAT_DIR)/test_cat.c $(CAT_DIR)/cat.c $(LDFLAGS) -o $(CAT_DIR)/s21_cat

s21_grep: $(GREP_DIR)/grep.c $(GREP_DIR)/grep.h $(GREP_DIR)/test_grep.c
	$(CC) $(CFLAGS) $(GREP_DIR)/test_grep.c $(GREP_DIR)/grep.c $(LDFLAGS) -o $(GREP_DIR)/s21_grep

tests: s21_cat s21_grep
	bash $(TESTS_DIR)/test_cat.sh; st_cat=$$?; \
	bash $(TESTS_DIR)/test_grep.sh; st_grep=$$?; \
	exit $$((st_cat || st_grep))

clean:
	rm -f $(CAT_DIR)/s21_cat $(GREP_DIR)/s21_grep

rebuild: clean all

leaks_linux:
	valgrind --tool=memcheck --leak-check=yes $(CAT_DIR)/s21_cat $(CAT_DIR)/test.txt
	valgrind --tool=memcheck --leak-check=yes $(GREP_DIR)/s21_grep -e re $(GREP_DIR)/test_files/test.txt $(GREP_DIR)/test_files/test_2.txt

leaks_mac_os:
	leaks -atExit -- $(CAT_DIR)/s21_cat $(CAT_DIR)/test.txt
	leaks -atExit -- $(GREP_DIR)/s21_grep -e re $(GREP_DIR)/test_files/test.txt $(GREP_DIR)/test_files/test_2.txt
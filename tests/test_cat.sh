#!/bin/bash

# Интеграционные тесты для s21_cat.
# Каждый тест сравнивает вывод s21_cat с выводом системной утилиты cat.

cd "$(dirname "$0")/.."

S21_CAT=src/cat/s21_cat
REF=cat
FILES="src/cat/test.txt src/cat/test_2.txt"

PASS=0
FAIL=0

check() {
    local desc="$1"
    shift
    if diff <("$S21_CAT" "$@") <("$REF" "$@") >/dev/null 2>&1; then
        echo "SUCCESS: $desc"
        PASS=$((PASS + 1))
    else
        echo "FAIL: $desc"
        FAIL=$((FAIL + 1))
    fi
}

check_vs() {
    local desc="$1"
    local ref_arg="$2"
    shift 2
    if diff <("$S21_CAT" "$@") <("$REF" $ref_arg $FILES) >/dev/null 2>&1; then
        echo "SUCCESS: $desc"
        PASS=$((PASS + 1))
    else
        echo "FAIL: $desc"
        FAIL=$((FAIL + 1))
    fi
}

check "no flags" $FILES
check "-e" -e $FILES
check "-n" -n $FILES
check "-b" -b $FILES
check "-s" -s $FILES
check "-t" -t $FILES

check_vs "GNU --number-nonblank (как cat -b)" -b --number-nonblank $FILES
check_vs "GNU --number (как cat -n)" -n --number $FILES
check_vs "GNU --squeeze-blank (как cat -s)" -s --squeeze-blank $FILES

echo
echo "Passed: $PASS, Failed: $FAIL"
[ "$FAIL" -eq 0 ]
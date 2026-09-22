#!/bin/bash

# Интеграционные тесты для s21_grep.
# Каждый тест сравнивает вывод s21_grep с выводом системной утилиты grep.

cd "$(dirname "$0")/.."

S21_GREP=src/grep/s21_grep
REF=grep
FILES="src/grep/test_files/test_2.txt src/grep/test_files/test.txt"
PATTERN=src/grep/test_files/pattern.txt

PASS=0
FAIL=0

check() {
    local desc="$1"
    shift
    if diff <("$S21_GREP" "$@") <("$REF" "$@") >/dev/null 2>&1; then
        echo "SUCCESS: $desc"
        PASS=$((PASS + 1))
    else
        echo "FAIL: $desc"
        FAIL=$((FAIL + 1))
    fi
}

check "pattern" re $FILES
check "-e" -e re $FILES
check "-e re -e ne" -e re -e ne $FILES
check "-q" -q re $FILES
check "-n" -n re $FILES
check "-s" -s re $FILES
check "-i" -i re $FILES
check "-v" -v re $FILES
check "-c" -c re $FILES
check "-l" -l re $FILES
check "-h" -h re $FILES
check "-f" -f $PATTERN re $FILES
check "-o" -o re $FILES
check "-ei" -ei re $FILES
check "-ev" -ev re $FILES
check "-ec" -ec re $FILES
check "-el" -el re $FILES
check "-en" -en re $FILES
check "-eh" -eh re $FILES
check "-es" -es re $FILES
check "-eo" -eo re $FILES
check "-vn" -vn re $FILES
check "-vh" -vh re $FILES
check "-vs" -vs re $FILES
check "-ef" -ef $PATTERN $FILES
check "-vf" -vf $PATTERN $FILES
check "-lf" -lf $PATTERN $FILES
check "-cf" -cf $PATTERN $FILES
check "-nf" -nf $PATTERN $FILES
check "-hf" -hf $PATTERN $FILES
check "-sf" -sf $PATTERN $FILES
check "-fo" -fo $PATTERN $FILES
check "-fv" -fv $PATTERN $FILES
check "-fl" -fl $PATTERN $FILES
check "-fc" -fc $PATTERN $FILES
check "-fn" -fn $PATTERN $FILES
check "-fh" -fh $PATTERN $FILES
check "-fs" -fs $PATTERN $FILES
check "-of" -of $PATTERN $FILES
check "-vo" -vo re $FILES
check "-cn" -cn re $FILES
check "-ch" -ch re $FILES
check "-cs" -cs re $FILES
check "-co" -co re $FILES
check "-ln" -ln re $FILES
check "-lh" -lh re $FILES
check "-ls" -ls re $FILES
check "-lo" -lo re $FILES
check "-nh" -nh re $FILES
check "-ns" -ns re $FILES
check "-no" -no re $FILES
check "-hs" -hs re $FILES
check "-ho" -ho re $FILES
check "-so" -so re $FILES

echo
echo "Passed: $PASS, Failed: $FAIL"
[ "$FAIL" -eq 0 ]
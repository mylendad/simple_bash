#ifndef GREP_H
#define GREP_H

#include <regex.h>

#define MAX_LINE_SIZE 1024

typedef struct flags
{
    int len;
    // char pattern_e[MAX_LINE_SIZE];
    char reg_pattern[MAX_LINE_SIZE];
    int e, i, v, c, l, n, h, s, f, o;
}flags;

void add_pattern(flags *argument, char *pattern);

flags parser(int args, char **argv);

void outline(char *line, int n);

FILE *reader(flags *argument, char *file_name);

void comparator(flags *argument, char *file, regex_t *reg, char **argv);

void output (flags *argument, int argc, char **argv);

#endif
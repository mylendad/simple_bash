#ifndef GREP_H
#define GREP_H

#include <regex.h>
#define MAX_LINE_SIZE 1024

typedef struct flags
{
    char *reg_pattern;
    int e, i, v, c, l, n, h, s, f, o;
}flags;

flags parser(int args, char **argv);


void outline(char *line, int n);

void comparator(flags *argument, char * file, regex_t *reg, char **argv);

void output (flags *argument, int argc, char **argv);

#endif
#ifndef GREP_H
#define GREP_H

#define MAX_LINE_SIZE 1024

typedef struct flags
{
    char *reg_pattern;
    int e, i, v, c, l, n, h, s, f, o;
}flags;

flags parser(int args, char ** argv);

void outline(char *line, int n);

void reader(flags argument, char* path, regex_t *reg);

void output (flags argument, int argc, char *argv[]);

#endif
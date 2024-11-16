#ifndef CAT_H
#define CAT_H

#define MAX_LINE_SIZE 1024

typedef struct flags
{
    int b, n, e, E, s, t, T, v;
}flags;

flags parser(int args, char ** argv);

void outline(flags *arg, char *line, int n);

void print(char *argv[], flags *flag);

void output (flags *arg, char *argv[]);

#endif
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include "cat.h"

flags parser(int args, char ** argv) {
    flags arg = {0};
    struct option long_option[] = { //  struct option: {const char *name;  int has_arg; int *flag;  int val;}
        {"number", no_argument, NULL, 'n'},
        {"number-nonblank", no_argument, NULL, 'b'},
        {"squezze-blank", no_argument, NULL, 's'},
        {0, 0, 0, 0}
    };
    
    int arguments;
    
    while ((arguments = getopt_long(args, argv, "bnEesTt", long_option, 0)) != -1) {

    switch (arguments)
    {
        case 'b':
            arg.b = 1;
            break;
        case 'n':
            arg.n = 1;
            break;
        case 'E':
            arg.E = 1;
            printf("%d", arg.E);
            break;
        case 'e':
            arg.E = 1;
            arg.v = 1;
            printf("flag e");
            break;
        case 's':
            arg.s = 1;
            break;
        case 'T':
            arg.T = 1;
            break;
        case 't':
            arg.T = 1;
            arg.v = 1;
            break;   
    default:
        perror("Error");
        exit(1);
        }
    }
    return arg;
}

char v_flag(unsigned char ch) {
    if (ch == '\n' || ch == '\t') {
        return ch; // предварительная проверка аргументов функции
    }
    if (ch <= 31) {
        putchar('^');
        ch += 64;
        // printf("flag v000000000");
    }
    if (ch > 127) {
        putchar('^');
        ch = '?';
        // printf("flag vV000000000");
    }
    return ch;
}

void outline(flags *arg, char *line, int n) {
    for (int i = 0; i < n; i++) {
        if (arg->E == 1 && line[i] == '\n') {
            putchar ('$');
        }
        if (arg->v == 1) {
            line[i] = v_flag(line[i]);
            
        }

        putchar(line[i]);
    }
}

void output (flags *arg, char **argv) {
     FILE *f = fopen(argv[optind], "r"); // optind -  индекс следующего обрабатываемого аргумента, иниц. "1"
    if (f == NULL) {
        perror("Error");
        return;
    }
    int line_counter = 1;
    char line[MAX_LINE_SIZE];
    // int read = fgets(line, MAX_LINE_SIZE, f);
    while (fgets(line, MAX_LINE_SIZE, f) != NULL) {
        if (arg->n == 1) {
            printf("%6d\t", line_counter);
        }
        outline(arg, line, strlen(line));  
        line_counter++;
    }

    fclose(f);
}

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
            // printf("%d", arg.E);
            break;
        case 'e':
            arg.E = 1;
            arg.v = 1;
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

char v_flag(unsigned char simbol) {
    if (simbol == '\n' || simbol == '\t') {
        return simbol; // предварительная проверка аргументов функции
    }
    if (simbol <= 31) {
        putchar('^');
        simbol += 64;
    }
    else {
        {
                  if (simbol < 127)
                    simbol = simbol;
                  else if (simbol == 127)
                    {
                      putchar('^');
                      simbol = '?';
                    }
                  else
                    {
                      putchar('M');
                      simbol = '-';
                      if (simbol >= 128 + 32)
                        {
                          if (simbol < 128 + 127)
                            simbol = simbol - 128;
                          else
                            {
                              putchar('^');
                              simbol = '?';
                            }
                        }
                      else
                        {
                          putchar('^');
                          simbol = simbol - 128 + 64;
                        }
                    }
                }
    }

    if (simbol == 127) {
        putchar('^');
        simbol = '?';
    }
    return simbol;
}

void outline(flags *arg, char *line, int n) {
    for (int i = 0; i < n; i++) {
        if (arg->E == 1 && line[i] == '\n') {
            putchar ('$');
        }
        if (arg->v == 1) {
            line[i] = v_flag(line[i]);
            }
        if (arg->T == 1 && line[i] == '\t') {
            putchar ('^');
            line[i] = 'I';
        }
        
    //     if (arg->T == 1) {
    //         if (line[0] == '\n') {
    //         printf("%6d\t", line_counter);
    //         }
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
        
        if (arg->b == 1) {
            if (line[0] == '\n') {
            printf("%6d\t", line_counter);
            }
        }
        if (arg->n == 1) {
            printf("%6d\t", line_counter);
        }
    if (arg->s == 0) {
        outline(arg, line, strlen(line));  
    }
    else {
        if (line[0] == '\n') {
                if (line[optind] != '\n') {
                    outline(arg, line, strlen(line));
                }
            }
    }
    line_counter++;
    
    }
    fclose(f);
}

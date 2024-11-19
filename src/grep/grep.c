#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
// #include <sys/types.h>
#include <getopt.h>
#include "grep.h"

flags parser(int args, char **argv) {
    flags argument = {0}; 
    int arguments;
  
    while ((arguments = getopt(args, argv, "e:ivclnhsf:o")) != -1) {
    
    switch (arguments)
    {
        case 'e':
            argument.e = 1;
            argument.reg_pattern = optarg;
            break;
        case 'i':
            argument.i = REG_ICASE;
            break;
        // case 'v':
        //     argument.v = 1;
        //     break;
        // case 'c':
        //     argument.E = 1;
        //     argument.v = 1;
        //     break;
        // case 'n':
        //     argument.s = 1;
        //     break;
        // case 'h':
        //     argument.T = 1;
        //     break;
        // case 's':
        //     argument.T = 1;
        //     argument.v = 1;
        //     break;   
        // case 'f':
        //     argument.T = 1;
        //     argument.v = 1;
        //     break; 
        // case 'o':
        //     argument.T = 1;
        //     argument.v = 1;
        //     break; 
        default:
            perror("Error");
            exit(1);
        }
        if (argument.reg_pattern == NULL) {
            argument.reg_pattern = argv[optind];
            optind++;
        }
    }
    return argument;
}


void reader(flags argument, char* path, regex_t *reg) {
    FILE* f = fopen(path, "r");
    if (f == NULL) {
        if (argument.s != 0) {
            perror(path);
        }
        exit(1);
    }

    char* line = NULL;
    int read = 0;

        while (getline(line, MAX_LINE_SIZE, f) != NULL) {
            int result = regexec(reg, line, 0, NULL, 0);
            if ((result == 0)) {
                outline(line, read);
                }
        }
        free(line);
        if (argument.c && argument.l) {
            fclose(f);
            }
    }


void outline(char *line, int n){
    for (int i = 0; i < n; i++) {
        putchar(line[i]);

    }
    if (line[n - 1] != '\n') {
        putchar('\n');
    }
}

void output (flags argument, int argc, char **argv) {
    
    argument = parser(argc, argv);
    regex_t reg;
    int result = regcomp(&reg, argument.reg_pattern, argument.i); // если больше 0 то ошибка
    if (result != 0) {
        perror ("Error");
        for (int i = optind; i < argc; i++) { // optind
            reader(argument, argv[i], &reg);
        }
    }

}

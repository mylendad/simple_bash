#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
// #include <sys/types.h>
#include <getopt.h>
#include "grep.h"

flags parser(int args, char **argv) {
    flags argument = {0}; 
    int arguments = getopt(args, argv, "e:ivclnhsf:o");
  
    while ((arguments) != -1) { // почему ":"
    
    switch (arguments)
    {
        case 'e':
            argument.e = 1;
            argument.reg_pattern = optarg; // optarg
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
    }
    if (argument.reg_pattern == NULL) {
            argument.reg_pattern = argv[optind]; // optind — это индекс следующего обрабатываемого элемента argv. Изначально "1"
            optind++;
        }
    return argument;
}

void reader(flags argument, char * path, regex_t *reg) {
    FILE* f = fopen(path, "r");
    if (f == NULL) {
        if (argument.s != 0) {
            perror(path);
        }
        return;
    }

    char line[MAX_LINE_SIZE];

        while (fgets(line, sizeof(line), f) != NULL) {
            int result = regexec(reg, line, 0, NULL, 0);
            if ((result == 0)) {
                outline(line, strlen(line));
                }
        }
            fclose(f);
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
       return;
    }
    for (int i = optind; i < argc; i++) { // optind
            reader(argument, argv[i], &reg);
        }
    regfree(&reg);
}

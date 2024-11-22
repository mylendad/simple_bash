#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include "cat.h"

flags parser(int args, char ** argv, int *counter) {
    flags argument = {0};
    struct option long_option[] = { //  struct option: {const char *name;  int has_arg; int *flag;  int val;}
        {"number", no_argument, NULL, 'n'}, // Если flag равен NULL, то getopt_long() возвращает val 
        {"number-nonblank", no_argument, NULL, 'b'}, // может быть: no_argument (или 0), если параметр не требует значения; required_argument (или 1), если параметр требует значения; optional_argument (или 2), если параметр может иметь необязательное значение.
        {"squeeze-blank", no_argument, NULL, 's'}, // значение, которое возвращается или загружается в переменную, на которую указывает flag.
        {NULL, 0, NULL, 0} 
    };
    
    int arguments;
  
    while ((arguments = getopt_long(args, argv, "bnEesTt", long_option, 0)) != -1) {
    
    switch (arguments)
    {
        case 'b':
            argument.b = 1;
            break;
        case 'n':
            argument.n = 1;
            break;
        case 'E':
            argument.E = 1;
            break;
        case 'e':
            argument.E = 1;
            argument.v = 1;
            break;
        case 's':
            argument.s = 1;
            break;
        case 'T':
            argument.T = 1;
            break;
        case 't':
            argument.T = 1;
            argument.v = 1;
            break;   
    default:
        perror("Error");
        exit(1);
        }
        (*counter)++;
   
    }
    
    return argument;
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

void outline(flags *argument, char *line, int n) {
    for (int i = 0; i < n; i++) {
        if (argument->E == 1 && line[i] == '\n') {
            putchar ('$');
        }
        
        if (argument->T == 1 && line[i] == '\t') {
            putchar ('^');
            line[i] = 'I';
        }
        if (argument->v == 1) {
            line[i] = v_flag(line[i]);
            }
        putchar(line[i]);
    }
}

void output (flags *argument, int file_count, char **argv) { // вынести в reader(no)
    
    for (int i = 0; i < file_count; i++) {
        FILE *f = fopen(argv[i], "r"); 
        if (f == NULL) {
            perror("Error");
            return; 
        }
        int line_counter = 1;
        char line[MAX_LINE_SIZE];
        int previous_line = 0;

        while (fgets(line, MAX_LINE_SIZE, f) != NULL) {
            int empty_line = 0;
            if (line[0] == '\n') {
                empty_line = 1;
            }
            if (argument->n == 1) {
                printf("%6d\t", line_counter);
                line_counter++;
            }
            if (argument->b == 1) {
                if (line[0] != '\n') {
                printf("%6d\t", line_counter);
                line_counter++;
                }
            }

                if (argument->s != 1 || previous_line == 0 || empty_line == 0){
            
                        outline(argument, line, strlen(line));
                    }
            previous_line = empty_line;
            // line_counter++;
        }
        fclose(f);
    } 
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include <getopt.h>
#include <errno.h>
#include "grep.h"


#define MAX_LINE_SIZE 1024

flags parser(int argc, char **argv) {
    flags argument = {0}; 
    errno = 22;
    int arguments;
    while ((arguments = getopt(argc, argv, "e:ivclnhsf:o")) != -1) { // Если за таким символом стоит двоеточие, то параметр требует указания аргумента. При этом getopt() помещает указатель на следующий за символом параметра текст в тот же элемент argv, или на текст следующего элемента argv в optarg. Возвращает символ параметра
        switch (arguments)
        {
            case 'e':
                argument.e = 1;
                add_pattern(&argument, optarg); // Если за таким символом стоит двоеточие, то параметр требует указания аргумента. При этом getopt() помещает указатель на следующий за символом параметра текст в тот же элемент argv, или на текст следующего элемента argv в optarg.
                break;
            case 'i':
                argument.i = REG_ICASE;
                break;
            case 'v':
                argument.v = 1;
                break;
            case 'c':
                argument.c = 1;
                break;
            case 'n':
                argument.n = 1;
                break;
            case 'l':
                argument.l = 1;
                break;
            case 'h':
                argument.h = 1;
                break;
            case 's':
                argument.s = 1;
                break;   
            case 'f':
                argument.f = 1;
                reader_regs(&argument, optarg);
                break; 
            case 'o':
                argument.o = 1;
                break;
            default:
                perror("ErrorParser");
                argument.error = 1;
            }
        }
            if (argument.len == 0 && optind < argc) { // на слчай если регулярное выражение не распарсилось с помощью флагов -e
                    add_pattern(&argument, argv[optind]); 
                optind++;
            }
        if (argument.reg_pattern == 0) {
            perror("No pattern.\n");
            argument.error = 1;
        }
    return argument;
}

void add_pattern(flags *argument, char *pattern) {
    int len_pattern = strlen(pattern);
  
    if (argument->len == 0) {
        argument->reg_pattern = malloc((len_pattern + 4 ) * sizeof(char));
        }
    if (len_pattern < len_pattern + argument->len) {
        argument->reg_pattern = realloc(argument->reg_pattern, (len_pattern + argument->len + 4) * sizeof(char));
        }
    if (argument->len > 0) {
        strcat(argument->reg_pattern, "|");
        argument->len++;
    }
    argument->len = argument->len + (sprintf(argument->reg_pattern + argument->len, "(%s)", pattern)); // SPRINTF Возвращаемая величина равна количеству символов, действительно занесенных в массив + \0
    

}

void reader_regs(flags *argument, char *file_name) {
   
    FILE *f = reader(file_name);

     if (f == 0) {
        perror(file_name);
        return;
    }
    char line[MAX_LINE_SIZE];
    int line_counter = 0;
   
        while (fgets(line, sizeof(line), f) != NULL) {
            
            if (line[strlen(line) - 1] == '\n') {
                line[strlen(line) - 1] = '\0';
            }
            add_pattern(argument, line);
            line_counter++;
            
    }
    fclose(f);

    //  if (argument->len == 0) {
    //     perror("No pattern in file");
    //     return;
    // }
}

void flag_o(regex_t* re, char* line) {
    regmatch_t math;
    int offset = 0;
    while (1) {
        int result = regexec(re, line + offset, 1, &math, 0);
        if (result != 0) {
            break;
        }
        for (int i = math.rm_so; i < math.rm_eo; i++) {
            putchar(line[i]);
             
        }
        putchar('\n');
        offset += math.rm_eo;
    }
  
}

void outline(char *line, int n) {
    for (int count_filename = 0; count_filename < n; count_filename++) {
        putchar(line[count_filename]); // putchar()
    }
    if (line[n - 1] != '\n') {
        putchar('\n');
    }
}
FILE *reader(char *file_name) {
       FILE* f = fopen(file_name, "r");
    return f;
}

void comparator(flags *argument, char *file_name, regex_t *reg, char **argv, int count_filename) { // regex_t *reg - структура для хранения скомпилированного регулярного выражения.
    FILE *f = reader(file_name);
    if (f == 0) {
        perror(file_name);
        return;
    }
    char line[MAX_LINE_SIZE];
    int count_reg = 0; 
    int line_counter = 1;
        while (fgets(line, sizeof(line), f) != NULL) {
            int result = regexec(reg, line, 0, NULL, 0); // int regexec(const regex_t *preg, const char *string, size_t nmatch, regmatch_t pmatch[], int eflags);
            if (((result == 0  && argument->v == 0) || (result != 0 && argument->v == 1)) && argument->c == 0 && argument->l == 0){ // с выводом строки
        
                if (argv[3] != NULL  && argument->h == 0){
                    if (strstr("-", argv[3]) == NULL) {
                        
                        printf("%s:", file_name);
                       
                    } 
                }
                if (argument->n == 1) {
                printf("%d:", line_counter);
                }   
                if (result == 0  && argument->o == 1) {
                 flag_o(reg, line);
                // printf("%s\n", argument->reg_pattern);
                // count_reg++;
                }   
                else {
                    outline(line, strlen(line));
                }
                } // дальше без вывода строки
           line_counter++;
            // if (result == 0  && argument->o == 1) {
            //     if (argv[3] != NULL  && argument->h == 0){
            //         if (strstr("-", argv[3]) == NULL) {    
            //             printf("%s:", file_name);
            //         }
            //     }
            //     printf("%s\n", argv[2]);
            //     count_reg++;
            // }
        if ((argument->c == 1 || argument->l == 1 )&& result == 0) {
                    count_reg++;
                }
        }
        if (count_reg > 0  && argument->l == 1) {
                char *name_file = argv[count_filename];
            printf("%s\n", name_file);
        }
        if (argument->c == 1){ // лишний prant argv[0]
        char *name_file = argv[count_filename];
         if (argv[4] != NULL) { 
            if (argument->h == 0) {
                        printf("%s:", name_file); 
                            }
                        // printf("%d:", argument->h);                 
                    }
                    printf("%d\n", count_reg);    
        }
            fclose(f);
}

void output (flags *argument, int argc, char **argv) {
    
    regex_t reg; // аргумент preg в  regcomp, regexec (хранение буфергого шаблона, указатель на заканчивающуюся null строку regex и флаги cflags, используемые для определения типа компиляции.)
    if (regcomp(&reg, argument->reg_pattern, REG_EXTENDED | argument->i) != 0) { // regcomp если больше 0 то ошибка; argument->count_filename - флаг в функции regcomp; | побитовая операция
        perror ("ErrorOutput");
       return;
    }
    int count_filename; 
    for (count_filename = optind; count_filename < argc; count_filename++) {  // optind    
           if (argv[4] != NULL  && argument->h == 0 && argument->l == 0 && argument->s == 0 && argument->o == 0 && argument->f == 0 && argument->e == 0 && argument->v == 0 && argument->i == 0 && argument->n == 0 && strstr("-", argv[1]) != NULL ){ 
                    if (strstr("-", argv[4]) == NULL) {
                printf("%s:", argv[count_filename]);
                 
            }
        }      
        comparator(argument, argv[count_filename], &reg, argv, count_filename); //  в regex_t сохранено скомпилированное регулярное выражение.
    }
    regfree(&reg); // Предоставив regfree предварительно обработанный буферный шаблон, preg освободит память, отведенную этому шаблону во время процесса компиляции regcomp.
}
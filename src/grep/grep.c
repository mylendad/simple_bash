// #include <stdio.h>
// #include <stdlib.h>
// #include <string.h>
// #include <regex.h>
// // #include <sys/types.h>
// #include <getopt.h>
// #include "grep.h"

// flags parser(int argc, char **argv) {
//     flags argument = {0}; 
//     int arguments = getopt(argc, argv, "e:ivclnhsf:o");
//     while ((arguments) != -1) { // Если за таким символом стоит двоеточие, то параметр требует указания аргумента. При этом getopt() помещает указатель на следующий за символом параметра текст в тот же элемент argv, или на текст следующего элемента argv в optarg. 
//         switch (arguments)
//         {
//             case 'e':
//                 argument.e = 1;
//                 argument.reg_pattern[0] = optarg; // // Если за таким символом стоит двоеточие, то параметр требует указания аргумента. При этом getopt() помещает указатель на следующий за символом параметра текст в тот же элемент argv, или на текст следующего элемента argv в optarg.
//                 break;
//             case 'count_filename':
//                 argument.count_filename = REG_ICASE; // не учитывать регистр
//                 break;
//             case 'v':
//                 argument.v = 1;
//                 argument.reg_pattern[0] = optarg;
//                 break;
//             case 'c':
//                 argument.c = 1;
//                 argument.reg_pattern[0] = optarg;
//                 break;
//             // case 'n':
//             //     argument.s = 1;
//             //     break;
//             // case 'h':
//             //     argument.T = 1;
//             //     break;
//             // case 's':
//             //     argument.T = 1;
//             //     argument.v = 1;
//             //     break;   
//             // case 'f':
//             //     argument.T = 1;
//             //     argument.v = 1;
//             //     break; 
//             // case 'o':
//             //     argument.T = 1;
//             //     argument.v = 1;
            
//             default:
//                 perror("ErrorParser");
//                 exit(1);
//             }
//         }
//         if (argument.reg_pattern[0] == NULL) { // // на слчай если регулярное выражение не распарсилось с помощью флагов
//                 argument.reg_pattern[0] = argv[optind]; // optind — это индекс следующего обрабатываемого элемента argv. Изначально "1"
//                 optind++;
//             }
//     return argument;
// }

// void comparator(flags argument, char * file_name, regex_t *reg) {
//     FILE* f = fopen(file_name, "r");
//     if (f == NULL) {
//         if (argument.s != 0) {
//             perror(file_name);
//         }
//         return;
//     }

//     char line[MAX_LINE_SIZE];
//     int count_reg = 0;
//         while (fgets(line, sizeof(line), f) != NULL) {
            
//             int result = regexec(reg, line, 0, NULL, 0); // int regexec(const regex_t *preg, const char *string, size_t nmatch, regmatch_t pmatch[], int eflags);
//             if ((result == 0  && argument.v == 0) || (result != 0 && argument.v == 1)){
//                 if (result == 0) {
//                 outline(line, strlen(line));
//                 // int result = regexec(reg, line, 0, NULL, 0);
//                 }
//             }
//              if (result == 0  && argument.c == 1) {
//                count_reg++;
//             }

//         }
//         if (argument.c == 1) {
//             printf("%d", count_reg);
//         }
//             fclose(f);
//     }


// void outline(char *line, int n){
//     for (int count_filename = 0; count_filename < n; count_filename++) {
//         putchar(line[count_filename]);

//     }
//     // if (line[n - 1] != '\n') {
//     //     putchar('\n');
//     // }
// }

// void output (flags argument, int argc, char **argv) {
    
//     argument = parser(argc, argv); // why?
//     regex_t reg; // аргумент preg в  regcomp, regexec (хранение буфергого шаблона, указатель на заканчивающуюся null строку regex и флаги cflags, используемые для определения типа компиляции.)
   
//     if (regcomp(&reg, argument.reg_pattern[0], argument.count_filename) != 0) { // regcomp если больше 0 то ошибка
//         perror ("ErrorOutput");
//        return;
//     }
 
//     for (int count_filename = optind; count_filename < argc; count_filename++) { // optind
//             comparator(argument, argv[count_filename], &reg);
//         }
//     regfree(&reg); // Предоставив regfree предварительно обработанный буферный шаблон, preg освободит память, отведенную этому шаблону во время процесса компиляции regcomp.
// }

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <regex.h>
#include <getopt.h>
#include "grep.h"


#define MAX_LINE_SIZE 1024

flags parser(int argc, char **argv) {
    flags argument = {0}; 
    int arguments;
    while ((arguments = getopt(argc, argv, "e:ivclnhsf:o")) != -1) { // Если за таким символом стоит двоеточие, то параметр требует указания аргумента. При этом getopt() помещает указатель на следующий за символом параметра текст в тот же элемент argv, или на текст следующего элемента argv в optarg. 
        switch (arguments)
        {
            case 'e':
                argument.e = 1;
                add_pattern(&argument, optarg); // // Если за таким символом стоит двоеточие, то параметр требует указания аргумента. При этом getopt() помещает указатель на следующий за символом параметра текст в тот же элемент argv, или на текст следующего элемента argv в optarg.
                break;
            case 'i':
                argument.i = REG_ICASE; // не учитывать регистр
                break;
            case 'v':
                argument.v = 1;
                argument.reg_pattern[0] = *optarg; // optarg
                break;
            case 'c':
                argument.c = 1;
                argument.reg_pattern[0] = *optarg;
                break;
            case 'n':
                argument.n = 1;
                argument.reg_pattern[0] = *optarg;
                break;
            case 'l':
                argument.l = 1;
                argument.reg_pattern[0] = *optarg;
                break;
            case 'h':
                argument.h = 1;
                argument.reg_pattern[0] = *optarg;
                break;
            case 's':
                argument.s = 1;
                argument.reg_pattern[0] = *optarg;
                break;   
            case 'f':
                argument.f = 1;
                argument.reg_pattern[0] = *optarg;
                break; 
            case 'o':
                argument.o = 1;
                argument.reg_pattern[0] = *optarg;
                break;
            default:
                perror("ErrorParser");
                exit(1);
            }
            // printf("%s:", *argv);
        }
        // printf("%s:", *argv);
        if (argument.reg_pattern[0] == 0 && optind < argc) { // // на слчай если регулярное выражение не распарсилось с помощью флагов
            add_pattern(&argument, argv[optind]);
            argument.reg_pattern[0] = *argv[optind]; // optind — это индекс следующего обрабатываемого элемента argv. Изначально "1"
            optind++;
            }
        if (argument.reg_pattern[0] == 0) {
            perror("No pattern.\n");
            exit(1);
    }
    return argument;
}

void add_pattern(flags *argument, char *pattern) {
    if (argument->len != 0) {
        strcat(argument->reg_pattern + argument->len, "|");
        argument->len++;
    }
    argument->len = argument->len + (sprintf(argument->reg_pattern + argument->len, "(%s)", pattern));
    printf("%s!!!\n", argument->reg_pattern);
    printf("%d!!!\n", argument->len);
}


void outline(char *line, int n){
    for (int count_filename = 0; count_filename < n; count_filename++) {
        
        // printf("%s:", argv[3]);
        putchar(line[count_filename]); // putchar()

    }
    // if (line[n - 1] != '\n') {
    //     putchar('\n');
    // }
}

FILE *reader(flags *argument, char *file_name) {
       FILE* f = fopen(file_name, "r");
    if (f == NULL) {
        if (argument->s == 0) {
        
            perror(file_name);
            
        }
        exit(1);
    }
    return f;
}


void comparator(flags *argument, char *file_name, regex_t *reg, char **argv) { // regex_t *reg - структура для хранения скомпилированного регулярного выражения.
 
    FILE *f = reader(argument, file_name);
    char line[MAX_LINE_SIZE];
    int count_reg = 0; 
    int line_counter = 1;
    

        while (fgets(line, sizeof(line), f) != NULL) {
            
            int result = regexec(reg, line, 0, NULL, 0); // int regexec(const regex_t *preg, const char *string, size_t nmatch, regmatch_t pmatch[], int eflags);
            if (result == 0  && argument->l == 1) {
                char *name = *argv;
    
            printf("%s\n", name+2);
        }
        // printf("%s",argv[2]);
            
            if (((result == 0  && argument->v == 0) || (result != 0 && argument->v == 1)) && argument->c == 0 && argument->o == 0){
        
                if (argv[3] != NULL  && argument->h == 0){
                    if (strstr("-", argv[3]) == NULL) {
                        
                        printf("%s:", file_name);
                    }
                    
                }

                 if (argument->n == 1) {
                printf("%d:", line_counter);
            }
        //          if (argv[4] != NULL) {
        //     //  printf("%s:", argv[count_filename]);
        // printf("%s:", argv[3]);
        
        // }


        // if (argv[4] != NULL) {
        //     //  printf("%s:", argv[count_filename]);
        // printf("%s:", file_name);
        
        
        // }
        // printf("%s:", *argv);

// count++;
        // printf("%s:!", file_name);
        // printf("count++!!!!");
        
        //     //  printf("%s:", argv[count_filename]);
        // printf("%s:", file_name);
       
                // if (result == 0  && argument->o == 0) {
                //     printf("%s\n", argv[0]);

               
            // }
        
            outline(line, strlen(line));
               
            
           
                }

            
           line_counter++;
        //    printf("count++!!!!");
        
            if (result == 0  && argument->o == 1) {
                printf("%s\n", argv[2]);
                count_reg++;
            }

            if (argument->c == 1 && result == 0) {
            
        }
       
        if (argument->c == 1 && result == 0) {
            // printf("%s:", *argv);
            // printf("%s:", *argv);
            // if (argv[3] != NULL  && argument->h == 0){
            //         if (strstr("-", argv[3]) == NULL) {
                    count_reg++;
            //             printf("%s:", file_name);
            //         }
                       
            // printf("%s:", *argv);
                }
                
         
        }
        printf("%d\n", count_reg);
        
            fclose(f);
    

}


void output (flags *argument, int argc, char **argv) {
    
    regex_t reg; // аргумент preg в  regcomp, regexec (хранение буфергого шаблона, указатель на заканчивающуюся null строку regex и флаги cflags, используемые для определения типа компиляции.)
    printf("%s", argument->reg_pattern);
    if (regcomp(&reg, argument->reg_pattern, REG_EXTENDED | argument->i) != 0) { // regcomp если больше 0 то ошибка; argument->count_filename - флаг в функции regcomp; | побитовая операция
        perror ("ErrorOutput");
       return;
    }
    int count_filename;
//  char *file_name = argv[count_filename];
    
    for (count_filename = optind; count_filename < argc; count_filename++) {  // optind
            
           if (argv[4] != NULL  && argument->h == 0){ // for flag -c
                    if (strstr("-", argv[4]) == NULL) {
                printf("%s:", argv[count_filename]);
            }
        }
        
        comparator(argument, argv[count_filename], &reg, argv);
    }
    regfree(&reg); // Предоставив regfree предварительно обработанный буферный шаблон, preg освободит память, отведенную этому шаблону во время процесса компиляции regcomp.
}

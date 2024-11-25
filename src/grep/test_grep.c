#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include "grep.h"





int main(int argc, char *argv[]) {
    int flag = 0;
    // if (argc < 2) { // предварительная проверка аргументов функции
    //     printf("Usage: %s <filename>\n", argv[0]);
    //     return 0; 
    // }
    // int counter = 1;
    flags argument = parser(argc, argv);
    if (argument.error == 1) {
        flag = 1;
    }
    // printf("Flags: e=%d, i=%d, v=%d, c=%d, n=%d, l=%d, h=%d, s=%d, f=%d, o=%d\n",
    //    argument.e, argument.i, argument.v, argument.c, argument.n,
    //    argument.l, argument.h, argument.s, argument.f, argument.o);
// printf("Pattern: %s\n", argument.reg_pattern);
    // if (optind >= argc) {
    //         perror("No files prrr.\n"); // изменить вывод
    //         flag = 1;
    // }
    // int index_for_file = argc - counter; 
    else {
        output(&argument, argc, argv);
        
        // flag++;
    }
    if (argument.reg_pattern != 0) {
        free(argument.reg_pattern);
    }
    // char* test_line = "
    //         printf("QQQQQQQQQQQQQQQQQQQQQ%ldQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ", strlen(test_line));
    return flag;
}

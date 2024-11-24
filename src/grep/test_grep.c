#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include "grep.h"





int main(int argc, char *argv[]) {
    // if (argc < 2) { // предварительная проверка аргументов функции
    //     printf("Usage: %s <filename>\n", argv[0]);
    //     return 0; 
    // }
    // int counter = 1;
    flags argument = parser(argc, argv);
    printf("Flags: e=%d, i=%d, v=%d, c=%d, n=%d, l=%d, h=%d, s=%d, f=%d, o=%d\n",
       argument.e, argument.i, argument.v, argument.c, argument.n,
       argument.l, argument.h, argument.s, argument.f, argument.o);
// printf("Pattern: %s\n", argument.reg_pattern);
    if (optind >= argc) {
            perror("No files prrr.\n");
            exit(1);
    }
    // int index_for_file = argc - counter; 
    output(&argument, argc, argv);
    // char* test_line = "
    //         printf("QQQQQQQQQQQQQQQQQQQQQ%ldQQQQQQQQQQQQQQQQQQQQQQQQQQQQQ", strlen(test_line));
    // return 0;
}

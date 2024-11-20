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
    // int index_for_file = argc - counter; 
    output(argument, argc, argv);
    return 0;
}

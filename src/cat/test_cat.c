#include <stdio.h>
#include <stdlib.h>

#include <getopt.h>
#include "cat.h"




int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 0; //флаг сделать
    }

    flags arg = parser(argc, argv);
    printf("@@@@@%d %d@@@@@@", arg.n, arg.s);
    output(&arg, argv);
    return 0;
}

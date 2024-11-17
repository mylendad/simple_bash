#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <getopt.h>
#include "cat.h"




int main(int argc, char *argv[]) {
    
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 0; //флаг сделать
    }
    int counter = 1;
    flags arg = parser(argc, argv, &counter);

   
    // for (i = 1; i < argc; i++) {
    //     if (strcmp(argv[i], "-b") == 0) {
    //         arg.b = 1;
    //     } else if (strcmp(argv[i], "-n") == 0) {
    //         arg.n = 1;
    //     } else if (strcmp(argv[i], "-s") == 0) {
    //         arg.s = 1;
    //     } else {
           
    //         break;
    //     }
    // }


    int index_for_file = argc - counter; 

   
    output(&arg, index_for_file, &argv[counter]);

    
    printf("@@@@@%d %d@@@@@@", arg.n, arg.s);
    // output(&arg, argv);
    return 0;
}

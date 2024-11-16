#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include <getopt.h>
#include "cat.h"

#define MAX_LINE_SIZE 1024


int main(int argc, char *argv[]) {
    if (argc < 2) {
        printf("Usage: %s <filename>\n", argv[0]);
        return 0;
    }

    flags arg = parser(argc, argv);
    FILE *f = fopen(argv[optind], "r"); // optind -  индекс следующего обрабатываемого аргумента, иниц. "1"
    if (f == NULL) {
        perror("Error");
        return 0;
    }

    char line[MAX_LINE_SIZE];
    // int read = fgets(line, MAX_LINE_SIZE, f);
    while (fgets(line, MAX_LINE_SIZE, f) != NULL) {
        outline(&arg, line, strlen(line));  
       
    }


    fclose(f);
    return 0;
}


    // FILE *f = fopen(argv[1], "r");

    // char *line = NULL;
    // size_t mem_for_line = 0;
    // int read_count = 0;
    // read_count = getline(&line, &mem_for_line, f);
    // while (read_count != -1) {
    //     outline(line, read_count);
    //     read_count = getline(&line, &mem_for_line, f);
    // }
    // fclose(f);
//     return 0;
    
// }
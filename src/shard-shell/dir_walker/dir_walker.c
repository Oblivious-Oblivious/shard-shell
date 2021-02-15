/* We want POSIX.1-2008 + XSI, i.e. SuSv4, features */
#define _XOPEN_SOURCE 700

/* Added on 2017-06-25:
   If the C library can support 64-bit file sizes
   and offsets, using the standard names,
   these defines tell the C library to do so. */
#define _LARGEFILE64_SOURCE
#define _FILE_OFFSET_BITS 64

#include <stdlib.h>
#include <unistd.h>
#include <ftw.h>
#include <time.h>
#include <stdio.h>
#include <string.h>
#include <errno.h>

#include "vector.h"

#ifndef USE_FDS
#define USE_FDS 15
#endif

vector *dir_list;

static int print_entry(const char *filepath,
                const struct stat *info,
                const int typeflag,
                struct FTW *pathinfo) {
    vector_add(dir_list, filepath);
    return 0;
}

struct vector *get_directory_list(const char *const starting_dir) {
    dir_list = new_vector();
    nftw(starting_dir, print_entry, USE_FDS, FTW_PHYS);
    return dir_list;
}

int main(void) {
    vector *l = get_directory_list(".");
    printf("size: %zu\n", vector_length(l));
}

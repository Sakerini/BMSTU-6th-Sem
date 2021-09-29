#include "print_file.h"
#include "print_directory.h"

int main(int argc, char *argv[])
{
    printf("ENVIRON:\n");
    if (print_file("/proc/10742/environ") < 0)
        return -1;

    printf("CMDLINE:\n");
    if (print_file("/proc/10742/cmdline") < 0)
        return -1;

    printf("mem:\n");
    if (print_file("/proc/10742/statm") < 0)
        return -1;

    printf("STAT:\n");
    if (print_stat() < 0)
        return -1;

    printf("FD:\n");
    if (print_directory("/proc/10742/fd/") < 0)
        return -1;

    return 0;
}

#include <stdlib.h>
#include <pthread.h>
#include <syslog.h>
#include <time.h>
#include <pwd.h>
#include <pthread.h>
#include "daemonize.h"
#include "already_running.h"

sigset_t mask;

int exitthr = 2;

void* run() {
    time_t timer = 0;
    while(1)
    {
        timer = time(NULL);
        syslog(LOG_INFO, "ПОТОК: время логирование %d\n", timer);
        sleep(5);
    }
}

int main(int argc, char *argv[])
{
    char *cmd;
    int c;

    cmd = strrchr(argv[0], '/');
    

    if (cmd == NULL)
        cmd = argv[0];
    else
        cmd++;

    daemonize(cmd);

    if (already_running())
    {
        printf("running");
        syslog(LOG_ERR, "демон уже запущен");
        return 1;
    }

    pthread_t id;
    int j = 1;

    pthread_create(&id, NULL, run, &j);

    time_t timer = 0;

    while(1)
    {
        timer = time(NULL);
        syslog(LOG_INFO, "время логирование %d\n", timer);
        sleep(5);
    }

    return 0;
}

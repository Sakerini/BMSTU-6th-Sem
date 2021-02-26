#include "daemonize.h"

static void
sighupHandler(int sig)
{
    time_t timer = time(NULL);
    syslog(LOG_INFO, "Daemon пользователь: %s время логирование %d\n", getlogin(), timer);
}

void daemonize(const char *cmd)
{
    int i, fd0, fd1, fd2;
    pid_t pid;
    struct rlimit rl;
    struct sigaction sa;

    // сбросить маску режима создания файла
    umask(0);

    // получить максимально возможный номер дескриптора файла
    if (getrlimit(RLIMIT_NOFILE, &rl) < 0)
    {
        perror("%s: невозможно получить максимальный номер дескриптора", cmd);
        exit(1);
    }

    // стать лидером новой сессии чтобы утратить управ. терминал
    pid = fork();
    if (pid < 0)
    {
        perror("%s: ошибка вызова функции fork", cmd);
        exit(1);
    }
    else if (pid != 0)
        exit(0);

    setsid();



    sa.sa_handler = sighupHandler;
    sigemptyset(&sa.sa_mask);
    sa.sa_flags = 0;

    if (sigaction(SIGHUP, &sa, NULL) < 0)
    {
        syslog(LOG_ERR, "%s: невозможно игнорировать сигнал SIGHUP", cmd);
        exit(1);
    }

   // назначить корневой каталог текущим каталогом, чтобы в последствие можно было отмонтировать файловую систему
    if (chdir("/") < 0)
    {
        syslog(LOG_ERR, "%s: невозможно сделать текущим рабочим каталогом /", cmd);
        exit(1);
    }

    // закрыть все открытые дескрипторы
    if (rl.rlim_max == RLIM_INFINITY)
        rl.rlim_max = 1024;

    for (i = 0; i < rl.rlim_max; i++)
        close(i);


    // присоединить файловые дескрипторы 0 , 1 , 2 к /dev/null
    fd0 = open("/dev/null", O_RDWR);
    fd1 = dup(0);
    fd2 = dup(0);

    // Инициализировать файл журналас
    openlog(cmd, LOG_CONS, LOG_DAEMON);

    if (fd0 != 0 || fd1 != 1 || fd2 != 2)
    {
        syslog(LOG_ERR, "ошибочные файловые дескрипторы %d %d %d", fd0, fd1, fd2);
        exit(1);
    }
}

#include <stdio.h>
#include <syslog.h>

int main(int argc, char *argv[])
{
  syslog(LOG_INFO, "HELLO WORLD");
  return 0;
}
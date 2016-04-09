#include <efi.h>
#include <efilib.h>

#include <sys/select.h>

void FD_SET(int fd, fd_set *set)
{
  Print(L"FD_SET stub called\r\n");
}

int FD_ISSET(int fd, fd_set *set)
{
  Print(L"FD_ISSET stub called\r\n");
  return 0;
}

void FD_CLR(int fd, fd_set *set)
{
  Print(L"FD_CLR stub called\r\n");
}

void FD_ZERO(fd_set *set)
{
  Print(L"FD_ZERO stub called\r\n");
}

int select(int nfds, fd_set *readfds, fd_set *writefds,
           fd_set *exceptfds, struct timeval *timeout)
{
  Print(L"select stub called\r\n");
  return 0;
}

#include <efi.h>
#include <efilib.h>

#include <signal.h>

#define SA_RESETHAND 0x80000000

int sigemptyset(sigset_t *set)
{
  Print(L"sigemptyset stub called\r\n");
  return 0;
}

int sigaddset(sigset_t *set, int signum)
{
  Print(L"sigaddset stub called\r\n");
  return 0;
}

int sigdelset(sigset_t *set, int signum)
{
  Print(L"sigdelset stub called\r\n");
  return 0;
}

int sigaction(int signum, const struct sigaction *act,
              struct sigaction *oldact)
{
  Print(L"sigaction stub called\r\n");
  return 0;
}

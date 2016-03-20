#include <efi.h>
#include <efilib.h>

#include <signal.h>

#define SA_RESETHAND 0x80000000

int sigaction(int signum, const struct sigaction *act,
              struct sigaction *oldact)
{
  Print(L"sigaction stub called\r\n");
  return 0;
}

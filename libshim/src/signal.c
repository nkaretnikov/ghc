#include <efi.h>
#include <efilib.h>

#include <../include/signal.h>

int sigaction(int signum, const struct sigaction *act,
              struct sigaction *oldact)
{
  Print(L"sigaction stub called\r\n");
  return 0;
}

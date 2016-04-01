#include <efi.h>
#include <efilib.h>

#include "../include/termios.h"

int tcgetattr(int fd, struct termios *termios_p)
{
  Print(L"tcgetattr stub called\r\n");
  return 0;
}

int tcsetattr(int fd, int optional_actions,
              const struct termios *termios_p)
{
  Print(L"tcsetattr stub called\r\n");
  return 0;
}

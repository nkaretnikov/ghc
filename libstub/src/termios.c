#include <efi.h>
#include <efilib.h>

#include <termios.h>

int tcsetattr(int fd, int optional_actions,
              const struct termios *termios_p)
{
  Print(L"tcsetattr stub called\r\n");
  return 0;
}

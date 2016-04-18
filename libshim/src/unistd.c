#include <efi.h>
#include <efilib.h>

#include <unistd.h>

pid_t fork(void)
{
  Print(L"fork stub called\r\n");
  return 0;
}

#include <efi.h>
#include <efilib.h>

#include <sys/times.h>

clock_t times(struct tms *ptms)
{
  Print(L"times stub called\r\n");
  return 0;
}

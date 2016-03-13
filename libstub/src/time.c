#include <efi.h>
#include <efilib.h>

#include <time.h>
#include <sys/signal.h>


int timer_create(
  clockid_t clock_id,
  struct sigevent *__restrict evp,
  timer_t *__restrict timerid)
{
  Print(L"timer_create stub called\r\n");
  return 0;
}

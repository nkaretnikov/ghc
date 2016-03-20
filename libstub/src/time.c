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

int clock_gettime(clockid_t clk_id, struct timespec *tp)
{
  Print(L"clock_gettime stub called\r\n");
  return 0;
}

int timer_settime(timer_t timerid, int flags,
                  const struct itimerspec *new_value,
                  struct itimerspec *old_value)
{
  Print(L"timer_settime stub called\r\n");
  return 0;
}

int timer_delete(timer_t timerid)
{
  Print(L"timer_delete stub called\r\n");
  return 0;
}

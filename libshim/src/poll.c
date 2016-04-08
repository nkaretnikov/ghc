#include <efi.h>
#include <efilib.h>

#include <poll.h>

int poll(struct pollfd *fds, nfds_t nfds, int timeout)
{
  Print(L"poll stub called\r\n");
  return 0;
}

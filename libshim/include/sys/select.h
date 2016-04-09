// newlib's header is not POSIX-compatible.
// #include_next <sys/select.h>
#include_next <sys/time.h>

#define FD_SETSIZE 64
typedef long int __fd_mask;
#define __NFDBITS (8 * (int) sizeof (__fd_mask))
typedef struct
{
  __fd_mask fds_bits[FD_SETSIZE / __NFDBITS];
} fd_set;

void FD_SET(int fd, fd_set *set);
int  FD_ISSET(int fd, fd_set *set);
void FD_CLR(int fd, fd_set *set);
void FD_ZERO(fd_set *set);

int select(int nfds, fd_set *readfds, fd_set *writefds,
           fd_set *exceptfds, struct timeval *timeout);

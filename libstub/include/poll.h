#define POLLIN          0x001
#define POLLOUT         0x004
#define POLLERR         0x008
#define POLLHUP         0x010

struct pollfd {
    int   fd;         /* file descriptor */
    short events;     /* requested events */
    short revents;    /* returned events */
};

typedef unsigned long int nfds_t;

int poll(struct pollfd *fds, nfds_t nfds, int timeout);

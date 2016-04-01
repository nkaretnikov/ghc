#include <stddef.h>
#include <sys/types.h>

#define PROT_READ     0x1
#define PROT_WRITE    0x2
#define PROT_EXEC     0x4
#define PROT_NONE     0x0
#define MAP_NORESERVE 0x4000
#define MAP_FIXED     0x10
#define MAP_ANON      0x20
#define MAP_PRIVATE   0x2

void *mmap(void *addr, size_t length, int prot, int flags,
           int fd, off_t offset);
int munmap(void *addr, size_t length);
int mprotect(void *addr, size_t len, int prot);

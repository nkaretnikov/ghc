#include <efi.h>
#include <efilib.h>

#include <sys/mman.h>

void *mmap(void *addr, size_t length, int prot, int flags,
           int fd, off_t offset)
{
  Print(L"mmap stub called\r\n");
  return 0;
}

int munmap(void *addr, size_t length)
{
  Print(L"munmap stub called\r\n");
  return 0;
}

int mprotect(void *addr, size_t len, int prot)
{
  Print(L"mprotect stub called\r\n");
  return 0;
}

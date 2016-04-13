#include <efi.h>
#include <efilib.h>

#include <dlfcn.h>

void *dlopen(const char *a, int b)
{
  Print(L"dlopen stub called\r\n");
  return 0;
}

void *dlsym(void *a, const char *b)
{
  Print(L"dlsym stub called\r\n");
  return 0;
}

int dlclose(void *a)
{
  Print(L"dlclose stub called\r\n");
  return 0;
}

char *dlerror(void)
{
  Print(L"dlerror stub called\r\n");
  return "";
}

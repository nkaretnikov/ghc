#include <efi.h>
#include <efilib.h>

#include <iconv.h>

iconv_t iconv_open (const char * x, const char * y)
{
  Print(L"iconv_open stub called\r\n");
  return (iconv_t) 0;
}

size_t iconv (iconv_t a, char ** b, size_t * c, char ** d, size_t * e)
{
  Print(L"iconv stub called\r\n");
  return 0;
}

int iconv_close (iconv_t x)
{
  Print(L"iconv_close stub called\r\n");
  return 0;
}

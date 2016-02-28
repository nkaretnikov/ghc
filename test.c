#include <stddef.h>
#include <iconv.h>

int
main ()
{
iconv_t cd;
                      cd = iconv_open("", "");
                      iconv(cd,NULL,NULL,NULL,NULL);
                      iconv_close(cd);
  ;
  return 0;
}

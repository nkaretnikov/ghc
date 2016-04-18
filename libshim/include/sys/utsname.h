#define __UTSNAME_LENGTH 65
struct utsname
{
  char sysname[__UTSNAME_LENGTH];
  char nodename[__UTSNAME_LENGTH];
  char release[__UTSNAME_LENGTH];
  char version[__UTSNAME_LENGTH];
  char machine[__UTSNAME_LENGTH];
};

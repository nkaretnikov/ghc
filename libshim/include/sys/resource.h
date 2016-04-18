#include_next <sys/resource.h>

#define rlim_t unsigned long int
struct rlimit
{
  rlim_t rlim_cur;
  rlim_t rlim_max;
};

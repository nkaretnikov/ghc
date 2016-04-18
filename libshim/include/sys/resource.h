#include_next <sys/resource.h>

#define rlim_t unsigned long int
struct rlimit
{
  rlim_t rlim_cur;
  rlim_t rlim_max;
};

#define RLIMIT_CPU    0
#define RLIMIT_FSIZE  1
#define RLIMIT_DATA   2
#define RLIMIT_STACK  3
#define RLIMIT_CORE   4
#define RLIMIT_NOFILE 7
#define RLIM_INFINITY 0xffffffffffffffffuLL

// Do not include newlib's header since it's unsupported (and triggers an error).
// #include_next <dirent.h>

#include <sys/types.h>

// XXX: See dirstream.h for a proper definition.
struct __dirstream
{
};
typedef struct __dirstream DIR;

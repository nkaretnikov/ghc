// newlib's siginfo_t lacks a few required fields.
// #include_next <signal.h>

typedef struct
{
  int si_signo;
  int si_code;
  int si_errno;
  int si_pid;
  int si_uid;
  int si_status;
} siginfo_t;

// XXX: Missing fields.
typedef struct sigaction
{
};

typedef struct sigevent
{
};

typedef struct
{
} sigset_t;